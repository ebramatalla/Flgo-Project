import Felgo 3.0
import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.15

/* This scene is information about the game  */
Scene {
    // BACKGROUND Image
    Image {
        anchors.fill: paren
        source: "../assets/BG.jpg"
    }


    // GAME INFORMATION
    Text {
        text: "
        Welcome in CHICKEN HUNTER game
        This game consists of 3 levels.
        In Level 1: The chicken move slowly, but as you processed it go faster
        In Level 2: The chicken move faster and faster
        In Level 3: Go and discover by yourself...

 "
        color: "white"
        font.family: "Anton"

        // Center the text
        anchors.centerIn: parent
    }

    // Setup BACK Button
    RoundButton {
        height: 30
        width: 30
        x:290
        y:210
        icon.source: "../assets/back-button-svgrepo-com.svg"

       // Handle user click
        onClicked: {
            // Create new compnent (menu)
            var Component = Qt.createComponent("Menu.qml")
            // Create new object from the component
            var window = Component.createObject(gameWindow)
            menu.visible = false
            window.show
        }
      }
}
