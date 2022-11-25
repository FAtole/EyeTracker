import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"

Rectangle {
    color: "#ffffff"
    border.color: "#37aaf7"


    Rectangle {
        id: headline
        x: 0
        y: 0
        width: 1540
        height: 110
        color: "#27343b"
        border.width: 0

        Text {
            id: text2
            x: 120
            y: 0
            width: 250
            height: 110
            color: "#ffffff"
            text: qsTr("Propositions")
            font.pixelSize: 40
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
        }
    }

    Rectangle {
        id: main_frame
        x: 0
        y: 110
        width: 1540
        height: 910
        color: "#202c33"
        border.width: 0

        Rectangle {
            id: rectangle1
            x: 0
            y: 870
            width: 1540
            height: 40
            color: "#14222b"
            border.width: 0

            Text {
                id: version
                x: 1400
                y: 0
                width: 70
                height: 40
                color: "#ffffff"
                text: qsTr("v1.0")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }

            Button {
                id: button_info
                x: 1480
                y: 1
                width: 38
                height: 38
                highlighted: false
                rightPadding: 0
                leftPadding: 0
                padding: 0
                autoExclusive: false
                checked: false
                checkable: false
                display: AbstractButton.TextOnly
                flat: true
                background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

                BorderImage {
                    id: borderImage
                    x: 0
                    y: 0
                    width: 38
                    height: 38
                    source: "../../../projecteyetracker/asset/images/icons8-info-512.png"
                }
            }
        }

        CustomTextField {
            id: customTextField
            x: 1000
            y: 100
            width:300
            height: 50
        }

        CustomButton {
            id: customButton
            x: 1325
            y: 100
            colorBgPressed: "#ff00e5"
            colorBgEntered: "#ff00e5"
            colorBg: "#37aaf7"
            textColorEntered: "#ffffff"
            textColor: "#ffffff"
        }

        Item {
            id: labels
            x:40
            y:200
            width:  1460
            height:  50

            Rectangle {
                id: selector
                x: 20
                y: 10
                width: 20
                height: 20
                color: "#00ffffff"
                radius: 2
                border.color: "#687983"
                border.width: 2
            }

            Text {
                id: text1
                x: 60
                y: 0
                width: 900
                height: 40
                color: "#ffffff"
                text: qsTr("QUESTION")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }
            Text {
                id: text3
                x: 960
                y: 0
                width: 200
                height: 40
                color: "#ffffff"
                text: qsTr("DATE")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }

            Image {
                id: image
                x: 1210
                y: 0
                width: 40
                height: 40
                source: "../../../projecteyetracker/asset/images/icons8-favorite-100.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text4
                x: 1300
                y: 0
                width: 200
                height: 40
                color: "#ffffff"
                text: qsTr("ACTION")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }

            Rectangle {
                id: rectangle
                x: 0
                y: 50
                width: 1460
                height: 1
                color: "#687983"
            }

        }

        ScrollView {
            x: 40
            y: 250
            width: 1470
            height: 500
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            Column {
                    id: column

                    width: parent.width
                    height: 500
                    clip: false

                    ReponseTableau { id:l1 }
                    ReponseTableau {id:l2
                        question: "Comment vas-tu ?2" }
                    ReponseTableau { id:l3}
                    ReponseTableau { id:l4}
                    ReponseTableau { id:l5}
                    ReponseTableau { id:l6}
                    ReponseTableau { id:l7}
                    ReponseTableau { id:l8}


            }
        }

        CustomButton {
            id: supprimer_plusieurs_btn
            x: 50
            y: 100
            text_b: "Supprimer"
            colorBg: "#ff0000"
            colorBgEntered: "#ff0000"
            colorBgPressed: "#ff0000"
            visible: false
        }
    }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
