import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow{
    id: window 


    width: 1920
    height: 1080
    visible: true
    visibility: "FullScreen"

    title: qsTr("Home Page")

    // SET FLAGS
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    property string version_ :"v2.0"
    property string font_in_eyetrakerPage :"Arial"
    property int size_font_in_eyetrackerPage : 100
    
    Rectangle {
        id: header
        x: 0
        y: 0
        width: 1920
        height: 60
        color: "#4e626d"
        border.color: "#4e626d"
        border.width: 0

        Text {
            id: titre_app
            x: 30
            y: 0
            width: 350
            height: 60
            color: "#ff0000"
            text: "Eye Tracker"
            font.pixelSize: 50
            verticalAlignment: Text.AlignVCenter
            clip: false
            font.family: "Roboto"
        }
        Button {
            id: button
            x: 1860
            y: 10
            width: 40
            height:40
            text: ""
            flat: true
            onClicked: window.close()
            background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }
            Image {
                id: image1
                x: 0
                y: 0
                width: 40
                height: 40
                source: "../images/icons8-multiply-96.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }


    StackView {
        id: stackView2
        x: 0
        y: 60
        initialItem: Qt.resolvedUrl("pages/PartieAssistant.qml")
    }
    Component.onCompleted: stackView2.push(Qt.resolvedUrl("pages/PartieAssistant.qml"))
}