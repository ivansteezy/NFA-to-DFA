import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick 2.15
import Qt.labs.qmlmodels 1.0

Window {
    visible: true
    width: 700
    height: 750
    title: qsTr("NFA to DFA")

    GridLayout {
        id : grid
        anchors.fill: parent
        rows    : 12
        columns : 12

        property double colMulti : grid.width / grid.columns
        property double rowMulti : grid.height / grid.rows

        function prefWidth(item) { return colMulti * item.Layout.columnSpan }
        function prefHeight(item){ return rowMulti * item.Layout.rowSpan    }

        Rectangle {
            Layout.rowSpan   : 2
            Layout.columnSpan: 12

            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)

            RowLayout {
                anchors.fill: parent
                Rectangle {
                    Layout.preferredWidth: parent.width / 2
                    Layout.preferredHeight: parent.height
                    Row {
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 20

                        Column {
                            width: 100
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter - 10
                            Label {text: "Alfabeto"}
                            TextField {

                                width: 100
                                height: 40
                                font.pixelSize: 18
                                wrapMode: Text.WordWrap
                            }
                        }

                        Button {
                            anchors.verticalCenter: parent.verticalCenter

                            width: 100
                            height:  40
                            text: "Agregar"
                        }
                    }

                }
                Rectangle {
                    Layout.preferredWidth: parent.width / 2
                    Layout.preferredHeight: parent.height
                    Row {
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 20

                        Column {
                            width: 100
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter - 10
                            Label {text: "Estados"}

                            TextField {

                                width: 100
                                height: 40
                                font.pixelSize: 18
                                wrapMode: Text.WordWrap
                            }
                        }
                        Column {
                            width: 80
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter - 10
                            Label {text: "Final"}
                            CheckBox {
                                width: 60
                                height: 60
                            }
                        }

                        Button {
                            anchors.verticalCenter: parent.verticalCenter

                            width: 100
                            height:  40
                            text: "Agregar"
                        }
                    }
                }
            }

        }
        Rectangle {
            Layout.rowSpan   : 2
            Layout.columnSpan: 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                Rectangle {
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height / 5
                    Label {
                        text: "Transiciones"
                        font.pixelSize: 18
                    }
                }

                Row {
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height / 1.5

                    Column {
                        width: parent.width/4
                        height: parent.height
                        Label{text:"Estado Origen"}
                        ComboBox {
                            height: parent.height / 2.5
                            model:["primero", "segundo", "tercero"]
                        }
                    }

                    Column {
                        width: parent.width/4
                        height: parent.height
                        Label{text:"Entrada"}
                        ComboBox {
                            height: parent.height / 2.5
                            model:["primero", "segundo", "tercero"]
                        }
                    }

                    Column {
                        width: parent.width/4
                        height: parent.height
                        Label{text:"Destino"}
                        ComboBox {
                            height: parent.height / 2.5
                            model:["primero", "segundo", "tercero"]
                        }
                    }

                    Column {
                        width: parent.width/4
                        height: parent.height
                        Button {

                            height: parent.height / 2.5
                            width: parent.width

                            text: "Agregar"
                        }
                    }
                }
            }
        }
        Rectangle {
            Layout.rowSpan   : 2
            Layout.columnSpan: 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Row {
                    anchors.fill: parent
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height
                    Column {
                        width: parent.width/3
                        height: parent.height / 1.5
                        anchors.verticalCenter: parent.verticalCenter
                        Label{
                            text:"Estado inicial"
                        }
                        ComboBox {
                            height: parent.height / 2.5
                            width: parent.width / 1.5

                            model:["primero", "segundo", "tercero"]
                        }
                    }

                    Label {
                        text: "Estado A"
                        font.pixelSize: 18
                        height: parent.height / 2.5
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
        Rectangle {
            Layout.rowSpan : 4
            Layout.columnSpan : 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Rectangle {
                    Layout.preferredWidth: parent.width / 2
                    Layout.preferredHeight: parent.height
                    TableView  {
                        width: parent.width
                        height: parent.height
                        columnSpacing: 1
                        rowSpacing: 1
                        clip: true

                        model: TableModel {
                            TableModelColumn { display: "name" }
                            TableModelColumn { display: "color" }

                            rows: [
                                {
                                    "name": "cat",
                                    "color": "black"
                                },
                                {
                                    "name": "dog",
                                    "color": "brown"
                                },
                                {
                                    "name": "bird",
                                    "color": "white"
                                }
                            ]
                        }

                        delegate: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 50
                            border.width: 1

                            Text {
                                text: display
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
                Rectangle {
                    Layout.preferredWidth: parent.width / 2
                    Layout.preferredHeight: parent.height
                    TableView  {
                        width: parent.width
                        height: parent.height
                        columnSpacing: 1
                        rowSpacing: 1
                        clip: true

                        model: TableModel {
                            TableModelColumn { display: "name" }
                            TableModelColumn { display: "color" }

                            rows: [
                                {
                                    "name": "cat",
                                    "color": "black"
                                },
                                {
                                    "name": "dog",
                                    "color": "brown"
                                },
                                {
                                    "name": "bird",
                                    "color": "white"
                                }
                            ]
                        }

                        delegate: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 50
                            border.width: 1

                            Text {
                                text: display
                                anchors.centerIn: parent
                            }
                        }
                    }
                }

            }

        }
        Rectangle {
            Layout.rowSpan : 2
            Layout.columnSpan : 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Row {
                    anchors.fill: parent
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height

                    Button {
                        id: generateButton
                        width: parent.width/4
                        height: parent.height/3
                        text: "Generar"
                        anchors.right: parent.right
                    }
                    Button {
                        width: parent.width/4
                        height: parent.height/3
                        anchors.right: generateButton.left
                        text: "Limpiar"
                    }
                }
            }
        }
    }
}
