from reader_csv import Loader_CSV
import sys
import os

# IMPORT MODULES
from PySide2.QtCore import QObject, Signal, Property, QUrl, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


class ItemModel(QObject):
    questionChanged = Signal(str)
    dateChanged = Signal(str)
    favorisChanged = Signal(bool)
    idChanged = Signal(int)

    def __init__(self, value1, value2, value3, value4):
        QObject.__init__(self)
        self.question = value1
        self.date = value2
        self.favoris = value3
        self.id = value4

    @Property(str, notify=questionChanged)
    def question_value(self):
        return self.question

    @question_value.setter
    def setquestion(self, text):
        self.question = text
        self.questionChanged.emit(self.question)   

    @Property(str, notify=dateChanged)
    def date_value(self):
        return self.date

    @date_value.setter
    def setdate(self, text):
        self.date = text
        self.dateChanged.emit(self.date)   

    @Property(bool, notify=favorisChanged)
    def favoris_value(self):
        return self.favoris

    @favoris_value.setter
    def setfavoris(self, boolean):
        self.favoris = boolean
        self.favorisChanged.emit(self.favoris)   

    @Property(int, notify=idChanged)
    def id_value(self):
        return self.id  

    @id_value.setter
    def setid(self, id):
        self.id = id  
        self.idChanged.emit(self.id)   


class ListModel(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.list_of_items = []

    def add_item(self, value1, value2, value3, value4):
        item = ItemModel(value1, value2, value3, value4)
        self.list_of_items.append(item)

    @Property("QVariantList")
    def model(self):
        return self.list_of_items


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self._model = ListModel()
        self.bdd_proposition = Loader_CSV()
        self.Load_items()

    def Load_items(self):
        index = 0
        for proposition in self.bdd_proposition.Propositions :
            self._model.add_item(proposition.question, proposition.date, proposition.favoris, index )
            index +=1

    @Property("QVariantList")
    def model(self):
        return self._model.model

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