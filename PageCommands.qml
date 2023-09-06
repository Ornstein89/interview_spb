import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id : pageCommands
    header: Rectangle {
        color: "blue"
        RowLayout{
            anchors.fill: parent
            anchors.margins: 2
            Item {
                id: name
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            ComboBox {
                textRole: "text"
                valueRole: "value"
                model: ListModel{
                    ListElement{text:"RU"; value:"ru_RU"}
                    ListElement{text:"EN"; value:"en_US"}
                }

                Layout.fillHeight: true
                font.pixelSize: Screen.pixelDensity * 4
                onCurrentIndexChanged: {
                    signalTranslate(currentValue)
                }
            }
        }
        height: Screen.pixelDensity * 10
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 2
        Button {
            text: qsTr("Добавить")
            Layout.preferredHeight: Screen.pixelDensity * 15
            Layout.preferredWidth: Screen.pixelDensity * 30
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: Screen.pixelDensity * 4
            onClicked: {
                pageCommandsAdd.clear();
                stackView.push(pageCommandsAdd)
            }
        }
        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model : modelCommands
            spacing : 1
            clip: true
            delegate: Rectangle {
                id : delegate
                radius : 3
                border.color : "darkBlue"
                border.width : 1
                height : Screen.pixelDensity * 15
                width : pageCommands.width
                gradient : Gradient {
                    GradientStop { position: 0.0; color: "lightcyan" }
                    GradientStop { position: 0.5; color: "azure" }
                    GradientStop { position: 1.0; color: "lightcyan" }
                }
                GridLayout{
                    anchors.fill: parent
                    anchors.margins: 2
                    Image {
                        source: image
                        fillMode: Image.PreserveAspectFit
                        Layout.row: 0
                        Layout.column: 0
                        Layout.rowSpan: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: delegate.height - 4
                    }
                    Text{
                        text : name
                        Layout.row: 0
                        Layout.column: 1
                        Layout.fillWidth: true
                        font {
                            bold : true
                            pixelSize: Screen.pixelDensity * 4
                        }
                    }
                    RoundButton{
                        Layout.row: 0
                        Layout.column: 2
                        Layout.rowSpan: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: delegate.height - 4

                        Timer {
                            id : tmrMockup
                            interval: 500;
                            running: false;
                            repeat: false
                            onTriggered: stop()
                        }

                        onClicked: {
                            tmrMockup.start()
                        }

                        BusyIndicator {
                            anchors.fill: parent
                            anchors.margins: 2
                            running: tmrMockup.running
                        }
                    }
                }
            }
        }
    }
}
