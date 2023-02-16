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
    property int nbrreponses: backend.currentItem.nombre_reponses


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
            font.pixelSize: 100

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Arial"
        }

        CustomButton {
            id: customButton
            x: 24
            y: 50
            colorBg: "#ff0000"
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

        Text {
            id: text1
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[0].reponse_value)
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Arial"
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }

        Text {
            id: text2
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[1].reponse_value)
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            anchors.rightMargin: 0
            font.bold: true
            font.family: "Arial"
        }

        Text {
            id: text3
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[2].reponse_value)
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            font.bold: true
            font.family: "Arial"
        }

        Text {
            id: text4
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[3].reponse_value)
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            font.bold: true
            font.family: "Arial"
            anchors.leftMargin: 0
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

        Text {
            id: text5
            x: 0
            y: 0
            width: 960
            height: 445
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[0].reponse_value)
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Arial"
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
            text: qsTr(backend.currentItem.ReponsesList[1].reponse_value)
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.topMargin: 0
            font.bold: true
            font.family: "Arial"
        }

        Text {
            id: text7
            x: 0
            y: 0
            width: 1920
            height: 445
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[2].reponse_value)
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.bold: true
            font.family: "Arial"
            anchors.leftMargin: 0
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

        Text {
            id: text8
            x: 0
            y: 0
            width: 960
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[0].reponse_value)
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            font.bold: true
            font.family: "Arial"
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }

        Text {
            id: text9
            x: 0
            y: 0
            width: 960
            color: "#ffffff"
            text: qsTr(backend.currentItem.ReponsesList[1].reponse_value)
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            font.bold: true
            font.family: "Arial"
        }

    }



}

