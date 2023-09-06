import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id : pageCommands
    ColumnLayout {
        anchors.fill: parent
        Button {
            text: "Add"
            Layout.preferredHeight: Screen.pixelDensity * 15
            Layout.preferredWidth: Screen.pixelDensity * 30
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                stackView.push(pageCommandsAdd)
            }
        }
        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model : commandsModel
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
                        Layout.preferredHeight: delegate.height - 4
                    }
                    //Text{
                    //
                    //}
                    //Button{
                    //
                    //}
                }
            }
        }
    }
}
