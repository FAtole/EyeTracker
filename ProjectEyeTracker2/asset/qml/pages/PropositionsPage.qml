import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"

Rectangle {
    color: "#ffffff"
    border.color: "#37aaf7"
    property int nbr_selected_prop: 0
    property var list_id_to_remove : []


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
                text: qsTr(version_)
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
                    source: "../../images/icons8-info-512.png"
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
            onButtonClicked: stackView.push(Qt.resolvedUrl("AjouterPropositionPage.qml"))


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
                source: "../../images/icons8-favorite-100.png"
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

            
            Component {
                id: delegateModel
                ReponseTableau {
                    question: model.modelData.question_value 
                    date: model.modelData.date_value 
                    isFavoris : model.modelData.favoris_value
                    id_proposition: model.modelData.id_value 
                    }
                
            }
            ListView {
                id: column

                width: parent.width
                height: 500
                clip: false

                model: backend.model
                delegate: delegateModel
                
            }
        }

        CustomButtonImage {
            id: supprimer_plusieurs_btn
            x: 50
            y: 100
            visible : (nbr_selected_prop>0)? true : false 

            onButtonClicked:popup_supp_multi_elements.open()

        }
    }


   Popup {
           id: popup_supp_un_element
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
                    onButtonClicked: popup_supp_un_element.close()
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
                        backend.Delete(backend.currentItem.id_value)
                        popup_supp_un_element.close()
                        stackView.push(Qt.resolvedUrl("PropositionsPage.qml"))
                    }
                }
           }

       }


        Popup {
           id: popup_supp_multi_elements
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

                    text: qsTr("Voulez-vous supprimer ces propositions ?")
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
                    onButtonClicked: popup_supp_multi_elements.close()
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
                        list_id_to_remove.forEach(id => backend.Delete(id))

                        popup_supp_multi_elements.close()
                        stackView.push(Qt.resolvedUrl("PropositionsPage.qml"))
                    }
                }
           }

       }
}

