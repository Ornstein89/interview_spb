import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id : pageCommandsAdd

    function clear(){
        edtCommandImage.clear();
        edtCommandName.clear();
    }

    GridLayout {
        id : layout1
        anchors.top: parent.top
        anchors.bottom: layout2.top
        anchors.margins: 2
        width: parent.width

        Item { // заполнитель
            Layout.row: 0
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Label{
            text : qsTr("Картинка")
            Layout.row: 1
            Layout.column: 0
            font.pixelSize: Screen.pixelDensity * 4
        }
        TextField{
            id : edtCommandImage
            Layout.row: 1
            Layout.column: 1
            Layout.fillWidth: true
            font.pixelSize: Screen.pixelDensity * 4
        }

        Label{
            text : qsTr("Название")
            Layout.row: 2
            Layout.column: 0
            font.pixelSize: Screen.pixelDensity * 4
        }
        TextField{
            id : edtCommandName
            Layout.row: 2
            Layout.column: 1
            Layout.fillWidth: true
            placeholderText: "Обязательное поле"
            font.pixelSize: Screen.pixelDensity * 4
        }

        Item {// заполнитель
            Layout.row: 3
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
    RowLayout{
        id : layout2
        anchors.bottom: parent.bottom
        anchors.margins: 2
        width: parent.width
        height: Screen.pixelDensity * 15
        Button {
            text : qsTr("Сохранить")
            enabled: edtCommandName.text !== ""
            Layout.row: 4
            Layout.column: 0
            Layout.fillWidth: true
            Layout.preferredHeight: Screen.pixelDensity * 15
            onClicked: {
                /* для использования с С++ QAbstractListModel */
                signalAppend(edtCommandName.text, edtCommandImage.text);
                /* для использования с QML ListModel
                modelCommands.append(
                    {"name": edtCommandName.text,
                     "image":edtCommandImage.text}) */
                signalUpdateModel();
                stackView.pop()
            }
        }

        Button {
            text : qsTr("Отмена")
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
