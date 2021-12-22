
import Felgo 3.0
import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.15

/* This scene for game menu */
Scene {
    // Set scene id
    id:menu

    // Add background image
    Image {
        id: bg
        anchors.fill: parent
        source: "../assets/BG.jpg"
    }

    // Add the chicken image
    MultiResolutionImage {
        // Set image name
        id: chiken

        // Set image coordinates
        x: 190
        y:20

        // Set image size
        height: 100
        width: 100

        // Load the image from the source
        source: "../assets/ch.png"
    }

    // Add Game name text
    Text {
        id: gamename
        // Set game name
        text: qsTr("𝖈𝖍𝖎𝖈𝖐𝖊𝖓 𝖍𝖚𝖓𝖙")
        font.pointSize: 24
        color: "white"
        // Set title coordinates
        x:160
        y:120
    }

    // Add Play Button
    RoundButton {
        // Set button width and hieght
        height: 30
        width: 30
        // Set button coordinates
        x:230
        y:180

        // Set button icon source
        icon.source: "../assets/play.png"

        // Handle user click on the button
        onClicked: {
                // Create level 1 component
                var Component =Qt.createComponent("../qml/levels/level1.qml")
                // Create new object from the Component
                var window =Component.createObject(gameWindow)
                // Let the menu disapear
                menu.visible=false
                // Show level 1
                window.show
           }
      }

    // Add exit Button
    RoundButton {
        // Set button width and hieght
        height: 30
        width: 30
        // Set button coordinates
        x:170
        y:210

        // Set button icon source
        icon.source: "../assets/exit.png"

        // Handle user click on the button
        onClicked: {
            // Just quit from the game
            Qt.quit()
         }
      }

    // Add game information Button
    RoundButton {
        // Set button width and hieght
        height: 30
        width: 30
        // Set button coordinates
        x:290
        y:210

        // Set button icon source
        icon.source: "../assets/info-icon-svgrepo-com.svg"

        // Handle user click on the button
        onClicked: {
              // Create info scene component
              var Component =Qt.createComponent("Game-Info.qml")
              // Create new object from the Component
              var window =Component.createObject(gameWindow)
              // Let the menu disapear
              menu.visible=false
              // Show Ifo
              window.show
           }
      }
}
