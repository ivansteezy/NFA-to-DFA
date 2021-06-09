import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

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
            color : 'red'
            Layout.rowSpan   : 2
            Layout.columnSpan: 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
        Rectangle {
            color : 'yellow'
            Layout.rowSpan   : 2
            Layout.columnSpan: 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
        Rectangle {
            color : 'black'
            Layout.rowSpan   : 2
            Layout.columnSpan: 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
        Rectangle {
            color : 'blue'
            Layout.rowSpan : 4
            Layout.columnSpan : 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
        Rectangle {
            color : 'green'
            Layout.rowSpan : 2
            Layout.columnSpan : 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
    }
}
