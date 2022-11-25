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

    property bool isFavoris: false
    property bool isChecked_Output: selector.checked
    

    width: 1460
    height: 70
    color: internal.dynamicBg
    border.width: 0

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
            source: "../../../projecteyetracker/asset/images/icons8-check-67 (3).png"
            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
            visible: selector.checked
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
            source: "../../../projecteyetracker/asset/images/icons8-heart-100.png"
            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
            visible: !checkBox_favoris.checked
        }
        Image {
            width: 40
            height: 40
            source: "../../../projecteyetracker/asset/images/icons8-heart-100 (1).png"

            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
            visible: checkBox_favoris.checked
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
            source: "../../../projecteyetracker/asset/images/icons8-play-96.png"

            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
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
            source: "../../../projecteyetracker/asset/images/icons8-more-90.png"
            rotation: 90

            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
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
            source: "../../../projecteyetracker/asset/images/icons8-trash-can-208.png"
            sourceSize.height: 500
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
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
