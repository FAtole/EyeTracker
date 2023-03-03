import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 1540
    height: 1020
    color: "#ffffff"
    border.color: "#ffffff"


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
            text: qsTr("Préférences")
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
                text: qsTr(version_)
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

        Text {
            id: text1
            x: 120
            y: 60
            width: 800
            height: 60
            color: "#ffffff"
            text: qsTr("Dans la page affichant les réponses")
            font.pixelSize: 30
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
        }

        Rectangle {
            id: rectangle
            x: 40
            y: 120
            width: 1460
            height: 1
            color: "#687983"
        }

        Text {
            id: text3
            x: 80
            y: 135
            width: 200
            height: 50
            color: "#ffffff"
            text: qsTr("Police d'écriture")
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            font.bold: false
            font.family: "Robot"
        }

        

        ComboBox {
            id: comboBox
            x: 300
            y: 135
            width: 200
            height: 50
            model :["Arial","Roboto","Time"]
            function index_to_font(font){
                if(font_in_eyetrakerPage=="Arial"){
                    return  0
                }
                if(font_in_eyetrakerPage=="Roboto"){
                    return 1
                }
                else{
                    return 2
                }
            }

            function font_to_index(id){
                if(id==0){
                    return  "Arial"
                }
                if(id==1){
                    return "Roboto"
                }
                else{
                    return "Time"
                }
            }

            currentIndex: index_to_font(font_in_eyetrakerPage)
            font.pointSize: 20
            font.family: "Roboto"

            delegate: ItemDelegate {
                    width: comboBox.width
                    text: comboBox.textRole ? (Array.isArray(comboBox.model) ? modelData[comboBox.textRole] : model[comboBox.textRole]) : modelData
                    font.weight: comboBox.currentIndex === index ? Font.DemiBold : Font.Normal
                    font.family: comboBox.font.family
                    font.pointSize: comboBox.font.pointSize
                    highlighted: comboBox.highlightedIndex === index
                    hoverEnabled: comboBox.hoverEnabled
                }
            onCurrentIndexChanged: font_in_eyetrakerPage = font_to_index(currentIndex)
        }

        Text {
            id: text4
            x: 80
            y: 215
            width: 350
            height: 50
            color: "#ffffff"
            text: qsTr("Taille de la police d'écriture")
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            font.bold: false
            font.family: "Robot"
        }

        Slider {
            id: slider
            x: 425
            y: 215
            width: 400
            height: 50
            orientation: Qt.Horizontal
            snapMode: RangeSlider.NoSnap
            live: true
            stepSize: 5
            to: 140
            from: 60
            value: size_font_in_eyetrackerPage
            onValueChanged: size_font_in_eyetrackerPage = slider.value
        }

        Text {
            id: text5
            x: 850
            y: 215
            width: 70
            height: 50
            color: "#ffffff"
            text: qsTr(slider.value+" px")
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
        }
    }
    

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
