import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id : pageCommandsAdd

    GridLayout {
        anchors.fill: parent
        Item { // заполнитель
            Layout.row: 0
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Label{
            text : "Картинка"
            Layout.row: 1
            Layout.column: 0
        }
        TextField{
            id : edtCommandImage
            Layout.row: 1
            Layout.column: 1
        }

        Label{
            text : "Название"
            Layout.row: 2
            Layout.column: 0
        }
        TextField{
            id : edtCommandName
            Layout.row: 2
            Layout.column: 1
            placeholderText: "Обязательное поле"
        }

        Item {// заполнитель
            Layout.row: 3
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Button {
            text : "Сохранить"
            enabled: edtCommandName.text !== ""
            Layout.row: 4
            Layout.column: 0
            Layout.fillWidth: true
            Layout.preferredHeight: Screen.pixelDensity * 15
            onClicked: {
                commandsModel.append(
                    {"name": edtCommandName.text,
                     "image":edtCommandImage.text})
                stackView.pop()
            }
        }

        Button {
            text : "Отмена"
            Layout.row: 4
            Layout.column: 1
            Layout.fillWidth: true
            Layout.preferredHeight: Screen.pixelDensity * 15
            onClicked: {
                stackView.pop()
            }
        }
    }
}
