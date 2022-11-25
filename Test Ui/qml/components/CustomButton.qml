import QtQuick 6.3
import QtQuick.Controls 6.3

Item {
    id: id_button
    width: btnWidth
    height: btnHeight
    // Custom Properties
    property color colorBg: "#37aaf7"
    property color colorBgEntered: "#ff00c5"
    property color colorBgPressed: "#ff00c5"
    property color textColor: "#ffffff"
    property color textColorEntered: "#ffffff"
    property string text_b: "Ajouter"
    property int btnHeight: 50
    property int btnWidth : 175

    Button{
        id:btn
        font.pointSize: 20
        font.family: "Roboto"
        width: parent.width
        height: parent.height
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
                                              btn.down ? textColorEntered : textColor
                                          } else {
                                              btn.hovered ? textColorEntered : textColor
                                          }
            }

        contentItem: Item{
               id: item1
               Text{
                   id: textBtn
                   text:text_b
                   anchors.fill: parent
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   font.family: btn.font.family
                   font.pointSize: btn.font.pointSize
                   color: internal.dynamicText
               }
        }
    }
}