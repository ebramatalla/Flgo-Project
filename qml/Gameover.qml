import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.15


// This scene apear when the user lose

Scene {
    id: gameover

    // Set the background image
    Image {
        id: bg
        anchors.fill: parent
        source: "../assets/BG.jpg"
    }

    // Add the chicken image
    Image {
        id: chiken
        x:190
        y:10
        width: 100
        height: 100
        source: "../assets/pngwing.com.png"
    }

    // Game Over text
    Text {
        x:155
        y:105
        font.pointSize: 24
        text: "𝗚𝗮𝗺𝗲 𝗢𝘃𝗲𝗿"
        color: "white"

    }

    // Player score text
    Text {
        x:120
        y:155
        font.pointSize: 24
        text: "𝗬𝗼𝘂𝗿 𝗦𝗰𝗼𝗿𝗲 𝗜𝘀 : " + score
        color: "white"

    }

    // Tell the user to go to main menu
    Text {
        x:150
        y:210
        font.pointSize: 18
        text: "Go To Main Menu"
        color: "white"
    }

    /* Handle user mouse click in the screen */
    MouseArea {
        // Enable the mouse click in all the screen
        anchors.fill: parent // Parent -> Scene

        // Handle if the user click the left button
        onReleased: {
            // Create new menu Component
            var Component =Qt.createComponent("Menu.qml")
            // Create new menu object
            var window =Component.createObject(gameWindow)
            // Disappear thee game over scene
            gameover.visible=false
            // Show the menu
            window.show
            // Re-initialize the score and the health
            score = 0
            helth = 3
        }
    }

}
