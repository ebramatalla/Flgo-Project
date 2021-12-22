import QtQuick 2.0
import Felgo 3.0

// EMPTY SCEN
Scene{
    Rectangle{
        anchors.fill: parent
        Keys.enabled: true
        Item {
            anchors.fill: GameWindow
            focus: true
            Keys.onPressed: {
                if (event.key === Qt.Key_Left) {
                    console.log("move left");
                    event.accepted = true;
                }
            }
        }}
}
