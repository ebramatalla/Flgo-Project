
import Felgo 3.0
import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
Scene {
    id:menu
    Image {
        id: bg
        anchors.fill: parent
        source: "../assets/BG.jpg"
    }
    MultiResolutionImage {
        id: chiken
        x: 190
        y:20
        height: 100
        width: 100

        source: "../assets/ch.png"
    }
    Text {
        id: gamename
        text: qsTr("𝖈𝖍𝖎𝖈𝖐𝖊𝖓 𝖍𝖚𝖓𝖙")
        font.pointSize: 24
        color: "white"
        x:160
        y:120

    }




    RoundButton {
        height: 30
        width: 30
        x:230
        y:180
        icon.source: "../assets/play.png"

        onClicked: {
                   var Component =Qt.createComponent("../qml/levels/Game.qml")
                       var window =Component.createObject(gameWindow)
                       menu.visible=false
                       window.show
                   }

      }
    RoundButton {
        height: 30
        width: 30
        x:170
        y:210
        icon.source: "../assets/exit.png"

        onClicked: {
            Qt.quit()
                   }


      }
    RoundButton {
        height: 30
        width: 30
        x:230
        y:240
        icon.source: "../assets/settings.svg"



      }
    RoundButton {
        height: 30
        width: 30
        x:290
        y:210
        icon.source: "../assets/info-icon-svgrepo-com.svg"
        onClicked: {
                   var Component =Qt.createComponent("info.qml")
                       var window =Component.createObject(gameWindow)
                       menu.visible=false
                       window.show
                   }



      }


        }
