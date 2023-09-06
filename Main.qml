import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 480
    height: 640
    visible: true
    title: qsTr("Задание на собеседование")

    signal signalUpdateModel();
    signal signalAppend(string name, string image);
    signal signalTranslate(string lang);

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
