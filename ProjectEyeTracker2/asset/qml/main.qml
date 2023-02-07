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
            background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

            Image {
                id: image4
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../images/icons8-home-500.png"
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
                id: text_Home
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
            onClicked: {
                text_Home.color = "#ffffff"
                text_Propositions.color = "#263F4F"
                text_Favoris.color = "#263F4F"
                text_Preferences.color = "#263F4F"
                text_Calibration.color = "#263F4F"
                stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
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
            background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

            Image {
                id: image5
                x: 0
                y: 10
                width: 40
                height: 40
                opacity: 1
                source: "../images/icons8-questions-90.png"
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
                id: text_Propositions
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
             onClicked: {
                text_Home.color = "#263F4F"
                text_Propositions.color = "#ffffff"
                text_Favoris.color = "#263F4F"
                text_Preferences.color = "#263F4F"
                text_Calibration.color = "#263F4F"
                stackView.push(Qt.resolvedUrl("pages/PropositionsPage.qml"))
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
            background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

            Image {
                id: image6
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../images/icons8-favorite-100.png"
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
                id: text_Favoris
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

            onClicked: {
                text_Home.color = "#263F4F"
                text_Propositions.color = "#263F4F"
                text_Favoris.color = "#ffffff"
                text_Preferences.color = "#263F4F"
                text_Calibration.color = "#263F4F"
                stackView.push(Qt.resolvedUrl("pages/FavorisPage.qml"))
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
            background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

            Image {
                id: image7
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../images/icons8-parameters-66.png"
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
                id: text_Calibration
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

            onClicked: {
                text_Home.color = "#263F4F"
                text_Propositions.color = "#263F4F"
                text_Favoris.color = "#263F4F"
                text_Preferences.color = "#263F4F"
                text_Calibration.color ="#ffffff"
                stackView.push(Qt.resolvedUrl("pages/CalibrationPage.qml"))
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
            background : Rectangle{
                         color: "#00000000"
                         border.width: 0
                     }

            Image {
                id: image8
                x: 0
                y: 10
                width: 40
                height: 40
                source: "../images/icons8-settings-64.png"
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
                id: text_Preferences
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
            onClicked: {
                text_Home.color = "#263F4F"
                text_Propositions.color = "#263F4F"
                text_Favoris.color = "#263F4F"
                text_Preferences.color = "#ffffff"
                text_Calibration.color = "#263F4F"
                stackView.push(Qt.resolvedUrl("pages/PreferencePage.qml"))
            }
        }
    }

    StackView {
        id: stackView
        x: 380
        y: 60
        initialItem: Qt.resolvedUrl("pages/HomePage.qml")
    }
    Component.onCompleted: stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
}