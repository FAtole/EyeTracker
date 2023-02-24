import csv
from pandas import notnull
from reader_csv import Loader_CSV
import datetime    
import sys
import os

# IMPORT MODULES
from PySide2.QtCore import QObject, Signal, Property,  Slot 
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

class Reponse(QObject):
    reponseChanged = Signal(str)

    def __init__(self, reponse):
        QObject.__init__(self)
        self.reponse = reponse

    @Property(str, notify=reponseChanged)
    def reponse_value(self):
        return self.reponse

    @reponse_value.setter
    def reponse_value(self, text):
        self.reponse = text
        self.reponseChanged.emit(self.reponse) 

class ListReponses(QObject):
    ListRepChanged = Signal("QVariantList")
    def __init__(self):
        QObject.__init__(self)
        self.list_reponses = []

    def add_rep(self,reponse):
        rep = Reponse(reponse)
        self.list_reponses.append(rep)

    @Property("QVariantList", notify=ListRepChanged)
    def model(self):
        return self.list_reponses
    
    @model.setter
    def model(self, list_reponses):
        self.list_reponses = list_reponses  
        self.ListRepChanged.emit(self.list_reponses)

class PropositionModel(QObject):
    ReponsesChanged = Signal("QVariantList")
    questionChanged = Signal(str)
    dateChanged = Signal(str)
    favorisChanged = Signal(bool)
    idChanged = Signal(int)

    def __init__(self, row,id):
        QObject.__init__(self)
        self.id = id
        self.question=row[3]
        self.reponses =row[4:]
        self.format =row[2]
        self.date =row[1]
        self.favoris = eval(row[0])
        self._reponse = ListReponses()
        for rep in self.reponses:
            self._reponse.add_rep(rep)
        
    @Property("QVariantList", notify=ReponsesChanged)
    def ReponsesList(self):
        return self._reponse.model

    @ReponsesList.setter
    def ReponsesList(self, _model):
        self._reponse = _model  
        self.ReponsesChanged.emit(self._reponse)

    @Property(int)
    def nombre_reponses(self):
        return len(self.reponses)

    @Property(str)
    def reponse1_value(self):
        return self.reponses[0]
    
    @Property(str)
    def reponse2_value(self):
        return self.reponses[1]
    
    @Property(str)
    def reponse3_value(self):
        return self.reponses[2] if len(self.reponses)>2 else ""
    
    @Property(str)
    def reponse4_value(self):
        return self.reponses[3] if len(self.reponses)>3 else ""

    @Property(str)
    def format_value(self):
        return self.format

    @Property(str, notify=questionChanged)
    def question_value(self):
        return self.question

    @question_value.setter
    def question_value(self, text):
        self.question = text
        self.questionChanged.emit(self.question)   

    @Property(str, notify=dateChanged)
    def date_value(self):
        return self.date

    @date_value.setter
    def date_value(self, text):
        self.date = text
        self.dateChanged.emit(self.date)   

    @Property(bool, notify=favorisChanged)
    def favoris_value(self):
        return self.favoris

    @favoris_value.setter
    def favoris_value(self, boolean):
        self.favoris = boolean
        self.favorisChanged.emit(self.favoris)   

    @Property(int, notify=idChanged)
    def id_value(self):
        return self.id  

    @id_value.setter
    def id_value(self, id):
        self.id = id  
        self.idChanged.emit(self.id)   


class ListPropositions(QObject):
    ListChanged = Signal("QVariantList")
    def __init__(self):
        QObject.__init__(self)
        self.list_of_items = []

    def load_item(self,row,id):
        item = PropositionModel(row,id)
        self.list_of_items.append(item)

    def add_item(self,row,id):
        item = PropositionModel(row,id)
        self.list_of_items.insert(0, item)

    def del_item(self,id):
        item = next(item for item in self.list_of_items if item.id == id)
        print(str(item.question))
        self.list_of_items.remove(item)
    
    def get_item(self, id):
        return next(item for item in self.list_of_items if item.id == id)

    @Property("QVariantList", notify=ListChanged)
    def model(self):
        return self.list_of_items
    
    @model.setter
    def setList(self, list_of_items):
        self.list_of_items = list_of_items  
        self.ListChanged.emit(self.list_of_items)


class MainWindow(QObject):
    ModelChanged = Signal("QVariantList")
    PropositionModelChanged = Signal(PropositionModel)

    def __init__(self):
        QObject.__init__(self)
        self._model = ListPropositions()
        self.bdd_proposition = Loader_CSV()
        self.Load_items()
        self.current_item = self._model.model[0]

    def Load_items(self):
        index = 0
        for proposition in self.bdd_proposition.Propositions :
            self._model.load_item(proposition.Get_row(), index )
            index +=1

    @Property("QVariantList", notify=ModelChanged)
    def model(self):
        return self._model.model

    @model.setter
    def setModel(self, _model):
        self._model = _model  
        self.ModelChanged.emit(self._model)

    @Property(PropositionModel, notify=PropositionModelChanged)
    def currentItem(self):
        return self.current_item

    @currentItem.setter
    def currentItem(self, item):
        self.current_item = item  
        self.PropositionModelChanged.emit(self.current_item)

    @Slot(str,str,str,str,str)
    def AddProp(self, question,rep1,rep2,rep3,rep4):
        print("Add")
        id = len(self._model.model)
        date = datetime.date.today().strftime('%d/%m/%Y')
        row = ["False",date, "Carre", question]
        if rep1 != "":
            row.append(rep1)
        if rep2 != "":
            row.append(rep2)
        if rep3 != "":
            row.append(rep3)
        if rep4 != "":
            row.append(rep4)
            
        self._model.add_item(row, id )
        self.Save()

    @Slot(int,result=PropositionModel)
    def GetItem(self, id):
        print("get "+str(id))
        return   self._model.get_item(id)

    @Slot(int)
    def Delete(self, id):
        print("Delete "+str(id))
        self._model.del_item(id)
        self.Save()

    @Slot()
    def Save(self):
        print("Save ")
        self.bdd_proposition.Save(self.model)

    


# INSTACE CLASS
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #lance le backend
    backend = MainWindow()
    engine.rootContext().setContextProperty("backend", backend)

    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "../asset/qml/main.qml"))

    # Check Exit App
    if not engine.rootObjects():
        sys.exit(-1)

        
    sys.exit(app.exec_())

