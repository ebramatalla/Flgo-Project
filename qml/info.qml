import Felgo 3.0
import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
// EMPTY SCENE

Scene {
    Image {
        anchors.fill: parent

        source: "../assets/BG.jpg"
    }


    Text {
        text: "The Game Contain 3
level The Frist Level the target move slowly
The second level the target move faster
The third the target move with rotation

 "
        color: "white"
        font.family: "Anton"


        anchors.centerIn: parent
    }
    RoundButton {
        height: 30
        width: 30
        x:290
        y:210
        icon.source: "../assets/back-button-svgrepo-com.svg"
        onClicked: {
                   var Component =Qt.createComponent("Menu.qml")
                       var window =Component.createObject(gameWindow)
                       menu.visible=false
                       window.show
                   }



      }


}
