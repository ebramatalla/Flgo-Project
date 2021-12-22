import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.15


// EMPTY SCENE

Scene {
    id:gameover
    property int fscore : activeScene.score


    Image {
        id: bg
        anchors.fill: parent
        source: "../assets/BG.jpg"
    }
    Image {
        id: chiken
        x:190
        y:10
        width: 100
        height: 100
        source: "../assets/pngwing.com.png"
    }


    Text {
        x:155
        y:105
        font.pointSize: 24
        text: "𝗚𝗮𝗺𝗲 𝗢𝘃𝗲𝗿"
        color: "white"

    }

    Text {
        x:120
        y:155
        font.pointSize: 24
        text: "𝗬𝗼𝘂𝗿 𝗦𝗰𝗼𝗿𝗲 𝗜𝘀 : " + score
        color: "white"

    }
    Text {
        x:150
        y:210
        font.pointSize: 18
        text: "𝗣𝗿𝗲𝘀𝘀 𝗧𝗼 𝗥𝗲𝘀𝘁𝗮𝗿𝘁"
        color: "white"

    }
    MouseArea {
        anchors.fill: parent
        onReleased: {
            var Component =Qt.createComponent("Menu.qml")
                var window =Component.createObject(gameWindow)
                gameover.visible=false
                window.show
                 lose.stop()
            score=0
            helth=03





        }
    }

}
