import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"


Rectangle {
    width: 1540
    height: 1020
    border.color: "#ffffff"

    property int nbr_rep: backend.currentItem.nombre_reponses
    property int maximumLength: 80


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
            x: 115
            y: 0
            width: 600
            height: 110
            color: "#ffffff"
            text: qsTr("Modifier la propositions")
            font.pixelSize: 40
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto"
        }

        Button{
            x: 55
            y: 25
            width: 60
            height: 60
            background: Rectangle{
                id: bg
                color: "#00ffffff"
            }

            contentItem: Image {
                id: image
                anchors.fill: parent
                source: "../../images/icons8-back-96.png"
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit

            }
            onClicked: stackView.pop()
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
            id: footer
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
                    source: "../../images/icons8-info-512.png"
                }
            }
        }


        Item {
            id: zone_question
            x: 35
            y: 140

            Text {
                id: text1
                width: 150
                height: 50
                color: "#ffffff"
                text: qsTr("QUESTION")
                font.pixelSize: 25
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                font.family: "Roboto"
            }

            Rectangle {
                id: rectangle
                x: 150
                y: 0
                width: 1290
                height: 50
                visible: true
                color: "#66687983"
                radius: 10
                border.width: 0
                clip: false

                TextEdit {
                    id: question_edit
                    x: 20
                    y: 0
                    width: 1250
                    height: 50

                    readOnly: false
                    property string previousText: text
                    color: "#ffffff"
                    text: qsTr(backend.currentItem.question_value)
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

            }
        }

        Item {
            id: zone_reponse
            x: 35
            y: 200

            Text {
                id: text4
                x: 0
                y: 0
                width: 150
                height: 50
                color: "#ffffff"
                text: qsTr("REPONSES")
                font.pixelSize: 25
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                font.bold: false
            }

            ScrollView {
                id: scrollView
                x: 150
                y: 70
                width: 1290
                height: 350
                clip: true
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                Column {
                    id: column
                    width: 1290
                    height: 352

                    visible: true
                    anchors.fill: parent
                    spacing: 0
                    clip: false

                    EnterReponseComponent{
                        nbr_reponse: nbr_rep
                        text_reponse: backend.currentItem.ReponsesList[0].reponse_value
                        onButtonClicked: nbr_rep=nbr_rep-1
                    }

                    EnterReponseComponent{
                        nbr_reponse: nbr_rep
                        text_reponse: backend.currentItem.ReponsesList[1].reponse_value
                        onButtonClicked: nbr_rep=nbr_rep-1
                    }

                    
                }


            }
            
            Component.onCompleted: {
                if (nbr_rep >= 3){
                    const newObject = Qt.createQmlObject(`
                        import "../components"

                        EnterReponseComponent{
                            nbr_reponse: nbr_rep
                            text_reponse: backend.currentItem.ReponsesList[2].reponse_value
                            onButtonClicked: nbr_rep=nbr_rep-1
                        }
                        `,
                        column );
                }

                if (nbr_rep >= 4){
                    const newObject = Qt.createQmlObject(`
                        import "../components"

                        EnterReponseComponent{
                            nbr_reponse: nbr_rep
                            text_reponse: backend.currentItem.ReponsesList[3].reponse_value
                            onButtonClicked: nbr_rep=nbr_rep-1
                        }
                        `,
                        column );
                }
                
            }

            Rectangle {
                x: 150
                y: 70
                width: 1290
                height: 2
                color: "#cc687983"
                border.width: 0
            }

            Button{
                id: add_reponse
                x: 720
                y: 380
                width: 100
                height: 100
                background: Rectangle{
                    color: "#00ffffff"
                }

                contentItem: Image {
                    anchors.fill: parent
                    source: "../../images/icons8-plus-512.png"
                    sourceSize.height: 96
                    sourceSize.width: 96
                    fillMode: Image.PreserveAspectFit

                }
                visible: (nbr_rep>3)? false : true
                onClicked: {
                    nbr_rep =nbr_rep + 1
                    const newObject = Qt.createQmlObject(`
                        import "../components"

                        EnterReponseComponent{
                            nbr_reponse: nbr_rep
                            text_reponse: "Reponse"
                            onButtonClicked: nbr_rep=nbr_rep-1
                        }
                        `,
                        column );

                }
            }
        }

        CustomButton {
            id: customButton
            x: 1290
            y: 770
            colorBgEntered: "#ffffff"
            colorBgPressed: "#ffffff"
            textColorEntered: "#ff0000"
            colorContour: "#ff0000"
            colorBg: "#ff0000"
            btnHeight: 60
            btnWidth: 200
            text_b: "Modifier"
            onButtonClicked:  {
                var reponses =[]
                for (var i=0; i<column.children.length; ++i){
                    if(column.children[i].text_reponse){
                        reponses.push(column.children[i].text_reponse)
                    }
                    else{
                        reponses.push("")
                    }
                }
                backend.ChangeProp(backend.currentItem.id_value,backend.currentItem.favoris_value,question_edit.text,
                                reponses[0],reponses[1],reponses[2],reponses[3])
            
                stackView.push(Qt.resolvedUrl("PropositionsPage.qml"))
            }
        }

        CustomButton {
            x: 100
            y: 770
            colorBg: "#14222b"
            colorBgPressed: "#37aaf7"
            colorBgEntered: "#37aaf7"
            btnHeight: 60
            btnWidth: 200
            text_b: "Annuler"
            onButtonClicked:  {
                stackView.pop()
            }
        }
    }

}

