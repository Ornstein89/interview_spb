import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id : pageCommands
    property int error_counter: 0

    Popup {
        id : popupError
        anchors.centerIn: parent
        width: pageCommands.width *2/3
        height: pageCommands.height *2/3
        modal: true
        focus: true
/*        closePolicy: Popup.CloseOnEscape
                    | Popup.CloseOnPressOutsideParent
                    | Popup.CloseOnPressOutside */

        Text{
            anchors.centerIn: parent
            text: qsTr("Ошибка!")
            color: "red"
            font.pixelSize: Screen.pixelDensity * 4
        }
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
                            onTriggered: {
                                stop();
                                console.log(pageCommands.error_counter)
                                if(pageCommands.error_counter==2){
                                    pageCommands.error_counter = 0;
                                    popupError.open();
                                }
                            }
                        }

                        onClicked: {
                            tmrMockup.start();
                            pageCommands.error_counter++;
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
