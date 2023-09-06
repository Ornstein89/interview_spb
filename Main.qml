import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 2.12
import QtQuick.Controls.Universal 2.12

ApplicationWindow {
    width: 480
    height: 640
    visible: true
    title: qsTr("Задание на собеседование")

    signal signalUpdateModel();
    signal signalAppend(string name, string image);
    signal signalTranslate(string lang);

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
                onActivated: {
                    signalTranslate(currentValue)
                }
            }
        }
        height: Screen.pixelDensity * 15
    }

    StackView {
        id : stackView
        anchors.fill: parent
        initialItem: pageCommands
        PageCommands{
            id : pageCommands
        }
        PageCommandsAdd{
            id : pageCommandsAdd
            visible: false
        }
    }

    /*для отладки
    ListModel {
        id : modelCommands

        ListElement {
            name : "Команда 1"
            image : "image1.svg"
        }
        ListElement {
            name : "Команда 2"
            image : "image2.svg"
        }
    }*/

}
