import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.15


Scene {
        id: level4
        width: 960
        height: 640
        property int health4:level3.health2

        property int speed: 3000
        property bool win: false


        property int score : 31
        onScoreChanged: {

            if(score > 51) {
              speed =2000
            }

        }
        onHealth4Changed: {
        if(health4==0){
            var Component =Qt.createComponent("../Gameover.qml")
                var window =Component.createObject(gameWindow)
                level4.visible=false
                window.show
            lose.play()

        }}
        EntityManager {
            id: entityManager
            entityContainer: level4
        }
        SoundEffect {
               id: kak
               source: "../../assets/audio/kak.wav"
           }
        SoundEffect {
            id: lose
            source: "../../assets/audio/Lose.wav"
        }
        SoundEffect {
               id: knifesound
               source: "../../assets/audio/KnifeShoot.wav"
           }


        PhysicsWorld {debugDrawVisible: false}

        Image {
            anchors.fill: parent

            source: "../assets/BG.jpg"
        }
        Image {
            id: player
            x: parent.width/2
            y: 560
            source: "../../assets/Knife.png"
            MouseArea{
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.maximumX: GameWindow.width - parent.width
                drag.minimumX:  0

                onReleased: {
                    entityManager.createEntityFromComponent(knife, 1)


                }



            }

        }


        Component {
            id: chiken
            EntityBase {
                entityType: "chiken"

                Image {
                    id: chikenimg
                    source: "../../assets/pngwing.com.png"
                    height: 110
                    width: 110

                }

                y: 60

                NumberAnimation on x {
                    from: -level4.width
                    to: level4.width
                    duration: speed
                    onStopped: {
                        if(!win){
                        health4--
                        }
                    }



                }



                BoxCollider {
                    anchors.fill: chikenimg
                    collisionTestingOnlyMode: true
                    fixture.onBeginContact: {

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
                }

                BoxCollider {
                    anchors.fill: knifeimg
                    collisionTestingOnlyMode: true
                }
            }
        }
        Component {
            id: egg

            EntityBase {
                entityType: "egg"
                Image {
                    id: eggimg
                    source: "../../assets/egg.png"
                }
                x:utils.generateRandomValueBetween(0, level4.width)


                PropertyAnimation on y {
                    from: chiken.y
                    to: level4.height
                    duration: 2000
                }

                BoxCollider {
                    anchors.fill: eggimg
                    collisionTestingOnlyMode: true
                    fixture.onBeginContact: {

                        var collidedEntity = other.getBody().target
                        if(collidedEntity.entityType === "knife") {
                            health4--
                            collidedEntity.removeEntity()
                            removeEntity()
                        }

                    }
                }
            }
        }




        Text {
            text: "score: " + score

            font.family: "Anton"
            font.pointSize: 24
            x:10
            y:10
            color: "white"


        }
        Text {
            text: "Health: " + health4

            font.family: "Anton"
            font.pointSize: 24
            x:830
            y:10

            color: "white"

        }
        Text {
            id: winlevel1
            text: qsTr("Level2 Be careful, the speed has increased
")
            x:220
            y:280
            color: "white"
            font.pointSize: 24
            visible: false


        }
        Timer {
            running: level4.visible == true
            repeat: true
            interval: 1000
            onTriggered: addTarget()
        }
        Timer {
            running: level4.visible == true
            repeat: true
            interval: 500
            onTriggered: addegg()
        }
        Timer {
            running: level4.visible == true
            repeat: true
            interval: 100
            onTriggered: addknife()
        }
        function addTarget() {
            entityManager.createEntityFromComponent(chiken)
        }
        function addegg() {
            entityManager.createEntityFromComponent(egg)
        } function addknife() {
            entityManager.createEntityFromComponent(knife)
        }




}


