import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: label

    property color colorBg: "#00000000"
    property color colorBgEntered: "#234e626d"
    property color colorBgPressed: "#234e626d"
    property color colorBgSelected: "#b337aaf7"
    property string question: "Comment vas-tu ?"
    property string date: "25/11/2022"
    property int id_proposition : 0
    property bool isFavoris: false
    property bool isChecked_Output: selector.checked

    
    width: 1460
    height: 70
    border.width: 0

    color: internal.dynamicBg
    property bool isFavorisOutPut: checkBox_favoris.checked
    QtObject{
        id: internal
        property color dynamicBg: if(selector.checked){
                                      selector.checked ? colorBgSelected : colorBg
                                  }
                                      else if(btn.down){
                                          btn.down ? colorBgPressed : colorBg
                                      } else {
                                          btn.hovered ? colorBgEntered : colorBg
                                      }
        }

    Button {
        id:btn
        x:60
        width: 1140
        height: parent.height
        clip: true
        background: Rectangle{
               color: "#00000000"
           }
        contentItem: Item{
            anchors.fill: parent
                Text {
                    y: 15
                    width: 900
                    height: 40
                    color: "#ffffff"
                    text: qsTr(question)
                    font.pixelSize: 20
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                }
                Text {
                    x: 900
                    y: 15
                    width: 200
                    height: 40
                    color: "#ffffff"
                    text: qsTr(date)
                    font.pixelSize: 20
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                }

        }
    }

    CheckBox {
        id: selector
        x: 10
        y: 15
        width: 40
        height: 40
        checked :false
        clip: true
        indicator:  Rectangle{
                        color: "#00000000"
                        border.width: 0
                    }
        Rectangle{
            x:10
            y:10
            width: 20
            height: 20
            color: "#00000000"
            border.color: "#687983"
            border.width: 2
        }
        Image {
            x:10
            y:10
            width: 20
            height: 20
            source: "../../images/icons8-check-67 (3).png"
            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
            visible: selector.checked
        }
        onClicked:{ 
            if(selector.checked) {
                nbr_selected_prop=nbr_selected_prop+1
                list_id_to_remove.push(id_proposition)
            }
            else{
                nbr_selected_prop=nbr_selected_prop-1
                var index = list_id_to_remove.indexOf(id_proposition) 
                list_id_to_remove.splice(index, 1);
            } 
        }
        
    }

    CheckBox {
        id: checkBox_favoris
        x: 1210
        y: 15
        width: 40
        height: 40
        checked :isFavoris
        clip: true
        indicator:   Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

        Image {
            width: 40
            height: 40
            source: "../../images/icons8-heart-100.png"
            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
            visible: !checkBox_favoris.checked
        }
        Image {
            width: 40
            height: 40
            source: "../../images/icons8-heart-100 (1).png"

            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
            visible: checkBox_favoris.checked
        }

        onClicked:  {
            backend.GetItem(id_proposition).favoris_value = checkBox_favoris.checked
            backend.Save()
        }


    }

    Button {
        id: start_button
        x: 1290
        y: 15
        width: 40
        height: 40
        clip :true
        background :   Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

        Image {
            width: 40
            height: 40
            source: "../../images/icons8-play-96.png"

            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            backend.currentItem = backend.GetItem(id_proposition)
            stackView2.push(Qt.resolvedUrl("../pages/EyeTrackerPage.qml"))
            }

    }

    Button {
        id: info_button
        x: 1340
        y: 15
        width: 40
        height: 40
        clip :true
        background :   Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }
        Image {
            width: 40
            height: 40
            source: "../../images/icons8-more-90.png"
            rotation: 90

            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            backend.currentItem = backend.GetItem(id_proposition)
            stackView.push(Qt.resolvedUrl("../pages/PropositionPage.qml"))
            }
    }

    Rectangle {
        x: 1385
        y: 15
        width: 1
        height: 40
        color: "#687983"
    }

    Button {
        id: delete_button
        x: 1400
        y: 15
        width: 40
        height: 40
        clip :true
        background :   Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }
        Image {
            width: 40
            height: 40
            source: "../../images/icons8-trash-can-208.png"
            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            backend.currentItem = backend.GetItem(id_proposition)
            popup_supp_un_element.open()
        }
    }

    Rectangle {
        x: 0
        y: 70
        width: 1460
        height: 1
        color: "#687983"
    }

}

/*##^##
Designer {
    D{i:0;height:70;width:1460}
}
##^##*/
