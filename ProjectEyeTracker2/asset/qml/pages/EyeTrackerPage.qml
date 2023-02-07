import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"


Rectangle {
    width: 1920
    height: 1020
    color: "#202c33"
    border.width: 0

    Rectangle {
        id: question_zone
        x: 0
        y: 0
        width: 1920
        height: 130
        color: "#14222b"
        border.width: 0

        Text {
            id: text_question
            color: "#ffffff"
            text: qsTr("Question")
            anchors.fill: parent
            font.pixelSize: 80
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Arial"

            CustomButton {
                id: customButton
                x: 24
                y: 50
                colorBg: "#ff0000"
                text_b: "Retour"
                onButtonClicked: stackView2.pop()
            }
        }
    }

     Rectangle {
            id: footer
            x: 0
            y: 980
            width: 1920
            height: 40
            color: "#14222b"
            border.width: 0

            Text {
                id: version
                x: 1780
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
                x: 1860
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

}
