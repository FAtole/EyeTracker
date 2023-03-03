import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"

Rectangle {
    id: eyetrackerpage
    width: 1920
    height: 1020
    color: "#202c33"
    border.color: "#202c33"
    border.width: 0
    property int nbrreponses: (backend.currentItem.nombre_reponses)? backend.currentItem.nombre_reponses :2


    Rectangle {
        id: question_zone
        x: 0
        y: 0
        width: 1920
        height: 130
        color: "#14222b"
        border.width: 0

        Text {
            id: text_question
            color: "#ffffff"
            text: qsTr(backend.currentItem.question_value)
            anchors.fill: parent
            font.pixelSize: size_font_in_eyetrackerPage

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: font_in_eyetrakerPage
        }

        CustomButton {
            id: customButton
            x: 24
            y: 50
            colorBg: "#ff0000"
            colorContour: "#ff0000"
            text_b: "Retour"
            onButtonClicked: stackView2.pop()
        }
    }

    Image {
        id: delimiter4

        x: 0
        y: 130
        width: 1920
        height: 890
        visible: (nbrreponses == 4 ) ? true : false
        source: "../../images/delimiter4.png"
        scale: 1
        sourceSize.height: 890
        sourceSize.width: 1920
        fillMode: Image.PreserveAspectFit
        property int index41 : 0
        property int index42 : 1
        property int index43 : 2
        property int index44 : 3

        Text {
            id: text1
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter4.index41]) ? backend.currentItem.ReponsesList[delimiter4.index41].reponse_value: "")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: font_in_eyetrakerPage
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }

        Text {
            y: 0
            id: text2
            x: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter4.index42]) ? backend.currentItem.ReponsesList[delimiter4.index42].reponse_value: "")
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            anchors.rightMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
        }

        Text {
            id: text3
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter4.index43]) ? backend.currentItem.ReponsesList[delimiter4.index43].reponse_value: "")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
        }

        Text {
            id: text4
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter4.index44]) ? backend.currentItem.ReponsesList[delimiter4.index44].reponse_value: "")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
            anchors.leftMargin: 0
        }

        Component.onCompleted: {
            function randomize(tab) {
                var i, j, tmp;
                for (i = tab.length - 1; i > 0; i--) {
                    j = Math.floor(Math.random() * (i + 1));
                    tmp = tab[i];
                    tab[i] = tab[j];
                    tab[j] = tmp;
                }
                return tab;
            }
            var index =[0,1,2,3]
            index = randomize(index);
            index41 = index[0]
            index42 = index[1]
            index43 = index[2]
            index44 = index[3]
        }
    }

    Image {
        id: delimiter3
        x: 0
        y: 130
        width: 1920
        height: 890
        visible: (nbrreponses == 3 ) ? true : false
        source: "../../images/delimiter3.png"
        sourceSize.width: 1920
        scale: 1
        sourceSize.height: 890
        fillMode: Image.PreserveAspectFit
        property int index31:0
        property int index32:1
        property int index33:2

        Text {
            id: text5
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter3.index31]) ? backend.currentItem.ReponsesList[delimiter3.index31].reponse_value: "")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: font_in_eyetrakerPage
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }

        Text {
            id: text6
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter3.index32]) ? backend.currentItem.ReponsesList[delimiter3.index32].reponse_value: "")
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.topMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
        }

        Text {
            id: text7
            x: 0
            y: 0
            width: 1920
            height: 445
            color: "#ffffff"
            text: qsTr((backend.currentItem.ReponsesList[delimiter3.index33]) ? backend.currentItem.ReponsesList[delimiter3.index33].reponse_value: "")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
            anchors.leftMargin: 0
        }

        Component.onCompleted: {
            function randomize(tab) {
                var i, j, tmp;
                for (i = tab.length - 1; i > 0; i--) {
                    j = Math.floor(Math.random() * (i + 1));
                    tmp = tab[i];
                    tab[i] = tab[j];
                    tab[j] = tmp;
                }
                return tab;
            }
            var index =[0,1,2]
            index = randomize(index);
            index31 = index[0]
            index32 = index[1]
            index33 = index[2]
        }
    }

    Image {
        id: delimiter2
        x: 0
        y: 130
        width: 1920
        height: 890
        visible: (nbrreponses == 2 ) ? true : false
        source: "../../images/delimiter2.png"
        sourceSize.width: 1920
        scale: 1
        sourceSize.height: 890
        fillMode: Image.PreserveAspectFit
        property int index21 : 0 //Math.floor(Math.random() * 2)
        property int index22 : 1-index21

        Text {
            id: text8
            x: 0
            y: 0
            width: 960
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[delimiter2.index21].reponse_value)
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }

        Text {
            id: text9
            x: 0
            y: 0
            width: 960
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[delimiter2.index22].reponse_value)
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: size_font_in_eyetrackerPage
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            font.bold: true
            font.family: font_in_eyetrakerPage
        }

        Component.onCompleted: {
            function randomize(tab) {
                var i, j, tmp;
                for (i = tab.length - 1; i > 0; i--) {
                    j = Math.floor(Math.random() * (i + 1));
                    tmp = tab[i];
                    tab[i] = tab[j];
                    tab[j] = tmp;
                }
                return tab;
            }
            var index =[0,1]
            index = randomize(index);
            index21 = index[0]
            index22 = index[1]
        }
    }



}

