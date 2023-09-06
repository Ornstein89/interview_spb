import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 480
    height: 640
    visible: true
    title: qsTr("Hello World")

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

    ListModel {
        id : commandsModel
        // для отладки
        ListElement {
            name : "Команда 1"
            image : "image1.svg"
        }
        ListElement {
            name : "Команда 2"
            image : "image2.svg"
        }
    }

}
