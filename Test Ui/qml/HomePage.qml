import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 1540
    height: 1020


    Rectangle {
        id: headline
        x: 0
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

    Rectangle {
        id: main_frame
        x: 0
        y: 110
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
                text: qsTr("Soleo saepe ante oculos ponere, idque libenter crebris usurpare sermonibus, omnis nostrorum imperatorum, omnis exterarum gentium potentissimorumque populorum, omnis clarissimorum regum res gestas, cum tuis nec contentionum magnitudine nec numero proeliorum nec varietate regionum nec celeritate conficiendi nec dissimilitudine bellorum posse conferri; nec vero disiunctissimas terras citius passibus cuiusquam potuisse peragrari, quam tuis non dicam cursibus, sed victoriis lustratae sunt.

Soleo saepe ante oculos ponere, idque libenter crebris usurpare sermonibus, omnis nostrorum imperatorum, omnis exterarum gentium potentissimorumque populorum, omnis clarissimorum regum res gestas, cum tuis nec contentionum magnitudine nec numero proeliorum nec varietate regionum nec celeritate conficiendi nec dissimilitudine bellorum posse conferri; nec vero disiunctissimas terras citius passibus cuiusquam potuisse peragrari, quam tuis non dicam cursibus, sed victoriis lustratae sunt.")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WordWrap
                font.bold: false
                font.family: "Roboto"
            }
        }
    }
}
