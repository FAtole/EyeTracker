# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'test.ui'
##
## Created by: Qt User Interface Compiler version 6.4.0
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QGridLayout, QMainWindow, QPushButton,
    QSizePolicy, QSpacerItem, QWidget)

class Ui_EyeTracker(object):
    def setupUi(self, EyeTracker):
        if not EyeTracker.objectName():
            EyeTracker.setObjectName(u"EyeTracker")
        EyeTracker.resize(1440, 1024)
        EyeTracker.setMouseTracking(False)
        self.centralWidget = QWidget(EyeTracker)
        self.centralWidget.setObjectName(u"centralWidget")
        self.centralWidget.setEnabled(True)
        self.centralWidget.setAutoFillBackground(False)
        self.gridLayout = QGridLayout(self.centralWidget)
        self.gridLayout.setSpacing(6)
        self.gridLayout.setContentsMargins(11, 11, 11, 11)
        self.gridLayout.setObjectName(u"gridLayout")
        self.horizontalSpacer_2 = QSpacerItem(664, 20, QSizePolicy.Expanding, QSizePolicy.Minimum)

        self.gridLayout.addItem(self.horizontalSpacer_2, 1, 2, 1, 1)

        self.horizontalSpacer = QSpacerItem(665, 20, QSizePolicy.Expanding, QSizePolicy.Minimum)

        self.gridLayout.addItem(self.horizontalSpacer, 1, 0, 1, 1)

        self.verticalSpacer = QSpacerItem(20, 40, QSizePolicy.Minimum, QSizePolicy.Expanding)

        self.gridLayout.addItem(self.verticalSpacer, 2, 1, 1, 1)

        self.pushButton = QPushButton(self.centralWidget)
        self.pushButton.setObjectName(u"pushButton")

        self.gridLayout.addWidget(self.pushButton, 1, 1, 1, 1)

        self.verticalSpacer_2 = QSpacerItem(20, 40, QSizePolicy.Minimum, QSizePolicy.Expanding)

        self.gridLayout.addItem(self.verticalSpacer_2, 0, 1, 1, 1)

        EyeTracker.setCentralWidget(self.centralWidget)

        self.retranslateUi(EyeTracker)

        QMetaObject.connectSlotsByName(EyeTracker)
    # setupUi

    def retranslateUi(self, EyeTracker):
        EyeTracker.setWindowTitle(QCoreApplication.translate("EyeTracker", u"MainWindow", None))
        self.pushButton.setText(QCoreApplication.translate("EyeTracker", u"PushButton", None))
    # retranslateUi

