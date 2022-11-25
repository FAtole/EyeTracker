import QtQuick 6.3
import QtQuick.Controls 6.3

Item {
    TextField {
        id: textField
        implicitHeight: 50
        width : 300

        placeholderText: qsTr("Recherche...")
        color: "#ffffff"
        
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        rightPadding: 0
        placeholderTextColor: "#4e626d"

        font.family:"Roboto"
        font.pointSize :20
        clip : false
        leftPadding: 75

        background: Rectangle {
            id :bgcolor
            color: "#00ffffff"
            radius: 10
            border.color: "#4e626d"
            border.width: 2

            Image {
                id : iconSearch
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source :"../../../projecteyetracker/asset/images/icons8-search-500.png"
                smooth: false
                cache: true
                mirror: false
                sourceSize.height: 500
                anchors.leftMargin: 10
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    onFocusChanged: {
        if(textField.focus){
            bgcolor.border.color = "#37AAF7"
        }else{
            textField.text = ""
            bgcolor.border.color = "#4e626d"
        }
    }
}

/*##^##
Designer {
    D{i:0;height:0;width:0}
}
##^##*/
