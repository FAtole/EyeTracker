import QtQuick 2.15
import QtQuick.Controls 2.15

import "../components"

Rectangle {
    width: 1540
    height: 1020


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
            x: 115
            y: 0
            width: 600
            height: 110
            color: "#ffffff"
            text: qsTr(backend.currentItem.question_value)
            font.pixelSize: 40
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
        }

        Button{
            x: 55
            y: 25
            width: 60
            height: 60
            background: Rectangle{
               id: bg
               color: "#00ffffff"
           }

            contentItem: Image {
                id: image
                anchors.fill: parent

                source: "../../images/icons8-back-96.png"
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit

            }
            onClicked: stackView.pop()
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
            id: footer
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

                BorderImage {
                    id: borderImage
                    x: 0
                    y: 0
                    width: 38
                    height: 38
                    source: "../../images/icons8-info-512.png"
                }
            }
        }


        Item {
            x: 1265
            y: 20

            Button {
                id: button_delete
                x: 100
                y: 0
                width: 90
                height: 90
                flat: true

                background :   Rectangle{
                    color: "#00000000"
                    border.width: 0
                }

                contentItem: Item{
                    x: 0
                    y: 0
                    Image {
                        x: 0
                        y: 0
                        width: 90
                        height: 90
                        source: "../../images/icons8-circle-100.png"
                        sourceSize.height: 100
                        sourceSize.width: 100
                    }
                    Image {
                        x: 15
                        y: 14
                        width: 60
                        height: 60
                        source: "../../images/icons8-trash-can-208.png"
                        sourceSize.height: 208
                        sourceSize.width: 208
                    }
                }
                onClicked: popup.open()
            }

            Button {
                id: button_play
                x: 0
                y: 0
                width: 90
                height: 90
                flat: true

                background :   Rectangle{
                    color: "#00000000"
                    border.width: 0
                }

                contentItem: Item{
                    Image {
                        x: 0
                        y: 0
                        width: 90
                        height: 90
                        source: "../../images/icons8-circle-100.png"
                        sourceSize.height: 100
                        sourceSize.width: 100
                    }
                    Image {
                        x: 18
                        y: 15
                        width: 60
                        height: 60
                        source: "../../images/icons8-play-96.png"
                        sourceSize.height: 208
                        sourceSize.width: 208
                    }
                }
                onClicked: {
                stackView2.push(Qt.resolvedUrl("../pages/EyeTrackerPage.qml"))
                }
            }
        }
        CustomButton {
            id: customButton
            x: 1290
            y: 770
            btnWidth: 200
            text_b: "Modifier"
        }

        Item {
            id: zone_question
            x: 35
            y: 140

            Text {
                id: text1
                width: 150
                height: 50
                color: "#ffffff"
                text: qsTr("QUESTION")
                font.pixelSize: 25
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                font.family: "Roboto"
            }

            Rectangle {
                id: rectangle
                x: 150
                y: 0
                width: 1290
                height: 50
                visible: true
                color: "#66687983"
                radius: 10
                border.width: 0
                clip: false

                Text {
                    id: text3
                    color: "#ffffff"
                    text: qsTr(backend.currentItem.question_value)
                    anchors.fill: parent
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                    font.family: "Roboto"
                }
            }
        }

        Item {
            id: zone_reponse
            x: 35
            y: 200
            Text {
                id: text4
                x: 0
                y: 0
                width: 150
                height: 50
                color: "#ffffff"
                text: qsTr("REPONSES")
                font.pixelSize: 25
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                font.bold: false
            }

            ScrollView {
                id: scrollView
                x: 150
                y: 70
                width: 1290
                height: 350
                clip: true
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff


                Component {
                    id: delegateModel
                    Rectangle {
                            x: 0
                            y: 0
                            width: 1290
                            height: 70
                            color:"#00ffffff"
                        Text {
                            x: 20
                            y: 0
                            width: 1250
                            height: 70
                            color: "#ffffff"
                            text: qsTr( model.modelData.reponse_value)
                            font.pixelSize: 25
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Roboto"
                        }

                        Rectangle {
                            x: 0
                            y: 70
                            width: 1290
                            height: 2
                            color: "#cc687983"
                            border.width: 0
                        }
                    }
                }
                ListView {
                    id: column

                    width: parent.width
                    height: 350
                    clip: false

                    model: backend.currentItem.ReponsesList
                    delegate: delegateModel

                }     
            }

            Rectangle {
                x: 150
                y: 70
                width: 1290
                height: 2
                color: "#cc687983"
                border.width: 0
            }
        }
    }

      Popup {
           id: popup
           x: 75
           y: 280
           width: 1000
           height: 400
           modal: true
           focus: true
           closePolicy: Popup.CloseOnEscape

           background: Rectangle{
                          color: "#14222B"
                          radius: 20
                          border.width: 0
           }

           contentItem: Item {
                x:0
                y:0
                Text {
                    x: 40
                    y: 20
                    width: 500
                    height: 60
                    color: "#ffffff"

                    text: qsTr("Attention")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 35
                    font.family: "Roboto"
                }

                Image {
                    x: 700
                    y: 20
                    width: 200
                    height: 200

                    source: "../../images/icons8-erreur-96.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 96
                    sourceSize.width: 96
                }

                Text {
                    x: 100
                    y: 110
                    width: 500
                    height: 150
                    color: "#ffffff"

                    text: qsTr("Voulez-vous supprimer cette proposition ?")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    font.family: "Roboto"
                }

                CustomButton {
                    x: 490
                    y: 300
                    colorBg: "#14222b"
                    colorBgPressed: "#37aaf7"
                    colorBgEntered: "#37aaf7"
                    btnHeight: 60
                    btnWidth: 200
                    text_b: "Annuler"
                    onButtonClicked: popup.close()
                }

                CustomButton {
                    x: 710
                    y: 300
                    colorBgEntered: "#ffffff"
                    colorBgPressed: "#ffffff"
                    textColorEntered: "#ff0000"
                    colorContour: "#ff0000"
                    colorBg: "#ff0000"
                    btnHeight: 60
                    btnWidth: 200
                    text_b: "Supprimer"
                    onButtonClicked:{
                        popup.close()
                        backend.Delete(backend.currentItem.id_value)
                        stackView.push(Qt.resolvedUrl("PropositionsPage.qml"))
                    }
                }
           }

       }

}
