import csv
from pandas import notnull
from reader_csv import Loader_CSV
import sys
import os

# IMPORT MODULES
from PySide2.QtCore import QObject, Signal, Property,  Slot 
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine



class ItemModel(QObject):
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

    @Property(str)
    def reponses_value(self):
        return self.reponses

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


class ListModel(QObject):
    ListChanged = Signal("QVariantList")
    def __init__(self):
        QObject.__init__(self)
        self.list_of_items = []

    def add_item(self,row,id):
        item = ItemModel(row,id)
        self.list_of_items.append(item)
    
    @Property(ItemModel)
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

    def __init__(self):
        QObject.__init__(self)
        self._model = ListModel()
        self.bdd_proposition = Loader_CSV()
        self.Load_items()

    def Load_items(self):
        index = 0
        for proposition in self.bdd_proposition.Propositions :
            self._model.add_item(proposition.Get_row(), index )
            index +=1

    @Property("QVariantList", notify=ModelChanged)
    def model(self):
        return self._model.model

    @model.setter
    def setModel(self, _model):
        self._model = _model  
        self.ModelChanged.emit(self._model)

    @Slot(int)
    def Save(self, id):
        print("Change"+str(id))
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

