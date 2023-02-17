import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id : reponse_id
    x: 0
    y: 0
    width: 1290
    height: 70
    property int nbr_reponse: 3
    property int maximumLength: 80
    property string text_reponse:"Rep 1"
    signal buttonClicked();

    TextEdit {
        x: 20
        y: 0
        width: 1250
        height: 70

        readOnly: false
        property string previousText: text
        color: "#ffffff"
        text: qsTr(text_reponse)
        font.pixelSize: 25
        verticalAlignment: Text.AlignVCenter
        font.family: "Roboto"

        onTextChanged: {
            if (text.length > maximumLength) {
                var cursor = cursorPosition;
                text = previousText;
                if (cursor > text.length) {
                    cursorPosition = text.length;
                } else {
                    cursorPosition = cursor-1;
                }
            }
            previousText = text
        }
    }

    Rectangle {
        x: 0
        y: 70
        width: 1290
        height: 2
        color: "#cc687983"
        border.width: 0
    }

    Button{
        x: 1220
        y: 10
        width: 50
        height: 50
        background: Rectangle{
            color: "#00ffffff"
        }

        contentItem: Image {
            anchors.fill: parent
            source: "../../images/icons8-trash-can-208.png"
            sourceSize.height: 96
            sourceSize.width: 96
            fillMode: Image.PreserveAspectFit

        }
        visible: (nbr_reponse>2)? true: false
        onClicked: {
            reponse_id.buttonClicked()
            reponse_id.destroy();
        }
    }
}

