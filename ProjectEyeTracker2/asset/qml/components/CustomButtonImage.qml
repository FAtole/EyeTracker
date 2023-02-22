import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: id_button
    width: btnWidth
    height: btnHeight
    // Custom Properties
    property color colorBg: "#FF0000"
    property color colorBgEntered: "#ff00c5"
    property color colorBgPressed: "#ff00c5"
    property color textColor: "#ffffff"
    property color textColorEntered: "#ffffff"
    property color textColorPressed: "#ffffff"
    property string text_b: "Ajouter"
    property string image_Source: "../../images/icons8-trash-can-208.png"
    property int btnHeight: 50
    property int btnWidth : 175
    signal buttonClicked();

    Button{
        id:btn
        font.pointSize: 20
        font.family: "Arial"
        width: parent.width
        height: parent.height
        icon.color: "#ffffff"
        background: Rectangle{
               id: bg
               color: internal.dynamicBg
               radius: 10

           }

        QtObject{
                id: internal

                property color dynamicBg: if(btn.down){
                                              btn.down ? colorBgPressed : colorBg
                                          } else {
                                              btn.hovered ? colorBgEntered : colorBg
                                          }

                property color dynamicText: if(btn.down){
                                              btn.down ? textColorPressed : textColor
                                          } else {
                                              btn.hovered ? textColorEntered : textColor
                                          }
            }

        contentItem: Item{
            id: item1
            x: 5
            y: 5
            width: 165
            height: 40
            Text{
                id: textBtn
                   width: 130
                   height: 40
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   font.family: "Arial"
                   font.pointSize: btn.font.pointSize
                   color: internal.dynamicText
                   text: "Supprimer"
               }
              Image {
                   id: name
                   x: 125
                   y: 0
                   width: 40
                   height: 40
                   source: image_Source
               }
        }

        onClicked: {
                id_button.buttonClicked()
            }
    }
}


