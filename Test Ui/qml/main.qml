import QtQuick 6
import QtQuick.Window 2.15
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window 
    width: 1920
    height: 1080
    visible: true
    visibility: "FullScreen"

    title: qsTr("Home Page")

    // SET FLAGS
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    
  
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
            text: ""
            flat: true
            onClicked: window.close()
            Image {
                id: image1
                x: 0
                y: 0
                width: 40
                height: 40
                source: "../../projecteyetracker/asset/images/icons8-multiply-96.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Rectangle {
        id: menu
        x: 0
        y: 60
        width: 380
        height: 1020
        color: "#14222b"

        Button {
            id: button_Home
            x: 20
            y: 30
            width: 315
            height: 60
            text: qsTr("")
            rightPadding: 0
            leftPadding: 0
            padding: 0
            display: AbstractButton.TextOnly
            flat: true

            Image {
                id: image4
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../../projecteyetracker/asset/images/icons8-home-500.png"
                cache: true
                sourceSize.width: 100
                smooth: false
                focus: false
                enabled: false
                transformOrigin: Item.Center
                sourceSize.height: 100
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text4
                x: 65
                y: 0
                width: 250
                height: 60
                color: "#ffffff"
                text: qsTr("Home")
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                transformOrigin: Item.Center
            }
        }

        Button {
            id: button_Propositions
            x: 20
            y: 100
            width: 315
            height: 60
            opacity: 1
            text: qsTr("")
            flat: true
            leftPadding: 0
            padding: 0
            display: AbstractButton.TextOnly
            rightPadding: 0

            Image {
                id: image5
                x: 0
                y: 10
                width: 40
                height: 40
                opacity: 1
                source: "../../projecteyetracker/asset/images/icons8-questions-90.png"
                clip: false
                smooth: false
                cache: true
                enabled: false
                focus: false
                sourceSize.width: 100
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 100
                transformOrigin: Item.Center
            }
            

            Text {
                id: text5
                x: 65
                y: 0
                width: 250
                height: 60
                color: "#263F4F"
                text: qsTr("Propositions")
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                transformOrigin: Item.Center
            }
        }

        Button {
            id: button_Favoris
            x: 20
            y: 170
            width: 315
            height: 60
            text: qsTr("")
            flat: true
            leftPadding: 0
            padding: 0
            display: AbstractButton.TextOnly
            rightPadding: 0

            Image {
                id: image6
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../../projecteyetracker/asset/images/icons8-favorite-100.png"
                smooth: false
                cache: true
                enabled: false
                focus: false
                sourceSize.width: 100
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 100
                transformOrigin: Item.Center
            }


            Text {
                id: text6
                x: 65
                y: 0
                width: 250
                height: 60
                color: "#263F4F"
                text: qsTr("Favoris")
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                transformOrigin: Item.Center
            }
        }

        Rectangle {
            id: separator
            x: 40
            y: 255
            width: 300
            height: 2
            color: "#263f4f"
            radius: 1
            border.width: 0
        }

        Text {
            id: text1
            x: 20
            y: 280
            width: 250
            height: 60
            color: "#ffffff"
            text: qsTr("Paramètres")
            font.pixelSize: 30
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
        }

        Button {
            id: button_Calibration
            x: 22
            y: 350
            width: 315
            height: 60
            text: qsTr("")
            flat: true
            leftPadding: 0
            padding: 0
            display: AbstractButton.TextOnly
            rightPadding: 0

            Image {
                id: image7
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../../projecteyetracker/asset/images/icons8-parameters-66.png"
                smooth: false
                cache: true
                enabled: false
                focus: false
                sourceSize.width: 100
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 100
                transformOrigin: Item.Center
            }

            Text {
                id: text7
                x: 65
                y: 0
                width: 250
                height: 60
                color: "#263F4F"
                text: qsTr("Calibration")
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                transformOrigin: Item.Center
            }
        }

        Button {
            id: button_Preferences
            x: 20
            y: 420
            width: 315
            height: 60
            text: qsTr("")
            flat: true
            leftPadding: 0
            padding: 0
            display: AbstractButton.TextOnly
            rightPadding: 0

            Image {
                id: image8
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../../projecteyetracker/asset/images/icons8-settings-64.png"
                asynchronous: false
                smooth: false
                cache: true
                enabled: false
                focus: false
                sourceSize.width: 100
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 100
                transformOrigin: Item.Center
            }


            Text {
                id: text8
                x: 65
                y: 0
                width: 250
                height: 60
                color: "#263F4F"
                text: qsTr("Préférences")
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                transformOrigin: Item.Center
            }
        }

        Rectangle {
            id: headline
            x: 380
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
                text: qsTr("Home")
                font.pixelSize: 40
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }
        }
    }

    Rectangle {
        id: main_frame
        x: 380
        y: 170
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

                BorderImage {
                    id: borderImage
                    x: 0
                    y: 0
                    width: 38
                    height: 38
                    source: "../../projecteyetracker/asset/images/icons8-info-512.png"
                }
            }
        }

        Image {
            id: image
            x: 340
            y: 10
            width: 800
            height: 480
            source: "../../projecteyetracker/asset/images/eye.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: rectangle2
            x: 170
            y: 520
            width: 1200
            height: 320
            color: "#4e626d"
            radius: 25
            border.width: 0

            Text {
                id: text3
                x: 25
                y: 25
                width: 1150
                height: 270
                color: "#ffffff"
                text: qsTr("Soleo saepe ante oculos ponere, idque libenter crebris usurpare sermonibus, omnis nostrorum imperatorum, omnis exterarum gentium potentissimorumque populorum, omnis clarissimorum regum res gestas, cum tuis nec contentionum magnitudine nec numero proeliorum nec varietate regionum nec celeritate conficiendi nec dissimilitudine bellorum posse conferri; nec vero disiunctissimas terras citius passibus cuiusquam potuisse peragrari, quam tuis non dicam cursibus, sed victoriis lustratae sunt. \n Soleo saepe ante oculos ponere, idque libenter crebris usurpare sermonibus, omnis nostrorum imperatorum, omnis exterarum gentium potentissimorumque populorum, omnis clarissimorum regum res gestas, cum tuis nec contentionum magnitudine nec numero proeliorum nec varietate regionum nec celeritate conficiendi nec dissimilitudine bellorum posse conferri; nec vero disiunctissimas terras citius passibus cuiusquam potuisse peragrari, quam tuis non dicam cursibus, sed victoriis lustratae sunt.")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.family: "Roboto"
            }
        }
    }

}