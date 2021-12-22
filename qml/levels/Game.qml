import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.15 // IMPORTANT for playing sounds

/*
  This is Level 1 of the game
*/
Scene {
        id: level1
        width: 960
        height: 640

        // User-defined variables
        property int helth: 3
        property int speed: 3000
        property bool win: false
        property int score : 0

        /**
          - Import all SoundEffects
        */
        SoundEffect {
            id: kak
             source: "../../assets/audio/kak.wav"
        }
        SoundEffect {
            id: knifesound
            source: "../../assets/audio/KnifeShoot.wav"
        }
        //updatesPerSecondForPhysics
        PhysicsWorld {debugDrawVisible: false}

        /**
          Event Handler: To handle the change of player's score
        */

        onScoreChanged: {
            if(score > 10) {
               speed =2500
            }
            if(score > 15) {
               speed=2000
            }
            if(score > 20) {
                // User win
                win=true
                // Inform him with simple message, that he is in level 2
                winlevel1.visible=true
            }

        }


        /**
          Event Hanlde: Handle player health
        */
        onHelthChanged: {
        if(helth == 0){
            // Take the user to GAME OVER SCENE
            var gameOverComponent = Qt.createComponent("../Gameover.qml")
            var window =gameOverComponent.createObject(gameWindow)
            level1.visible=false // Close the current level
            window.show // Show the new level
        }}

        /**
          Handle Components in the current level
        */
        EntityManager {
            id: entityManager
            entityContainer: level1
        }

        /* SETUP LEVEL 1 LAYOUT */

        // BACKGROUND Image
        Image {
            anchors.fill: parent // To fill all the window
            source: "../../assets/BG.jpg"
        }

        // KNIFE Image
        Image {
            id: player
            // Set coordinates of the knife
            x: 480
            y: 560
            source: "../../assets/Knife.png"
        }

        // SCORE Text
        Text {
            text: "Score: " + score
            font.family: "Anton"
            font.pointSize: 24
            color: "white"
            // Set coordinates of the score
            x:10
            y:10
        }

        // PLAYER HEALTH Text
        Text {
            text: "Health: " + helth
            font.family: "Anton"
            font.pointSize: 24
            color: "white"
            x:830
            y:10
        }

        // WIN LEVEL1 --> This text will apear win the user win the level 1
        Text {
            id: winlevel1
            text: qsTr("Passed Level 1, Be careful the speed has increased..")
            x:220
            y:280
            color: "white"
            font.pointSize: 24

            // This text initially un-visbile
            visible: false
        }


        // the frist Component in the scene
        Component {
            id: chiken
            // EntityBase
            EntityBase {
                entityType: "chiken"

                Image {
                    id: chikenimg
                    source: "../../assets/pngwing.com.png"
                    height: 110
                    width: 110

                }

                y: 60
                // This to make the chiken move from left to right
                NumberAnimation on x {
                    from: -level1.width
                    to: level1.width
                    duration: speed




                }


                // this is the collider handel collision of knife and chiken
                BoxCollider {
                    anchors.fill: chikenimg
                    collisionTestingOnlyMode: true
                    fixture.onBeginContact: {
                        // varible that contains info about the body hit the collideder
                        var collidedEntity = other.getBody().target

                        if(collidedEntity.entityType === "knife") {
                            score++
                            collidedEntity.removeEntity()
                            removeEntity()
                            kak.play()
                        }


                    }
                }
            }
        }

        Component {
            id: knife

            EntityBase {
                entityType: "knife"
                x:player.x
                y:player.y

                Image {
                    id: knifeimg
                    source: "../../assets/Knife.png"
                }


                PropertyAnimation on y {
                    from: player.y
                    to: GameWindow.height-100
                    duration: 200
                    onStopped: {
                        if(!win){
                        helth--
                        }
                    }

                }

                BoxCollider {
                    anchors.fill: knifeimg
                    collisionTestingOnlyMode: true
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onReleased: {


                entityManager.createEntityFromComponent(knife, 1)
                knifesound.play()
                if(winlevel1.visible){
                    var Component =Qt.createComponent("game3.qml")
                        var window =Component.createObject(gameWindow)
                        level1.visible=false
                        window.show


                }
            }
        }


        Timer {
            running: level1.visible == true
            repeat: true
            interval: 1000
            onTriggered: addTarget()
        }
        function addTarget() {
            entityManager.createEntityFromComponent(chiken)
        }




}


