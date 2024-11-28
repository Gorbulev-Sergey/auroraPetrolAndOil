import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property var proportion: [20,25,30,35,40,45,50]
    property int selectedProportion: proportion[0]

    property double petrol : 0

    function calculateOil(){
        return ((1*petrol)/selectedProportion).toFixed(2)
    }

    SilicaFlickable {
        objectName: "flickable"
        anchors.fill: parent
        contentHeight: layout.height + Theme.paddingLarge

        Column {
            id: layout
            objectName: "layout"
            width: parent.width
            spacing: 30

            PageHeader {
                objectName: "pageHeader"
                title: qsTr("Пропорции масла и бензина")
                extraContent.children: [
                    IconButton {
                        objectName: "aboutButton"
                        icon.source: "image://theme/icon-m-about"
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                    }
                ]
            }

            Column {
                anchors {
                    left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin
                }
                spacing: 15

                Label {
                    anchors { left: parent.left; right: parent.right; }
                    color: palette.highlightColor
                    font.pixelSize: Theme.fontSizeMedium
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    text: qsTr("Пропорция масла и бензина:")
                }

                Button {
                    id: buttonProporcia
                    anchors { horizontalCenter: parent.horizontalCenter }
                    backgroundColor: "#01a3a4"
                    text: qsTr("1/") + selectedProportion
                    onClicked: {
                        if (selectedProportion !== proportion[proportion.length-1])
                        {
                            selectedProportion = proportion[proportion.indexOf(selectedProportion)+1]}
                        else{
                            selectedProportion=proportion[0]
                        }
                    }
                }
            }

            Column {
                anchors {
                    left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin
                }
                spacing: 10

                Label {
                    id: labelPetrol
                    anchors { left: parent.left; right: parent.right;}
                    color: palette.highlightColor
                    font.pixelSize: Theme.fontSizeMedium
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    text: qsTr("Количесво бензина: ") + petrol + qsTr(" литров")
                }

                Slider {
                    id: sliderPetrolLitres
                    anchors { left: parent.left; right: parent.right;}
                    color: palette.highlightColor
                    minimumValue: 0
                    maximumValue: 50
                    stepSize: 1
                    onValueChanged: {
                        petrol = sliderPetrolLitres.value
                    }
                }
            }

            Column {
                anchors {
                    left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin
                }
                spacing: 10

                Label {
                    id: labelOil
                    anchors { left: parent.left; right: parent.right;}
                    color: palette.highlightColor
                    font.pixelSize: Theme.fontSizeMedium
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    text: qsTr("Количесво масла: ") + calculateOil() + qsTr(" литров")
                }
            }

        }
    }
}
