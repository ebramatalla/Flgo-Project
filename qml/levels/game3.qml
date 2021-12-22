import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.15


// EMPTY SCENE

    Scene {
        id: level3
        width: 960
        height: 640
        property int health2: scene.helth

        property int speed: 3000
        property int rotspeed: 3000
        property bool win3: false


        property int score : 21
        onScoreChanged: {
            if(score>25)
            {
                speed=3000
                rotspeed=1500
            }if(score>30)
            {
                winlevel3.visible=true
                win3=true
            }
        }
        onHealth2Changed: {
        if(health2==0){
            var Component =Qt.createComponent("../Gameover.qml")
                var window =Component.createObject(gameWindow)
                level3.visible=false
                window.show
            lose.play()

        }}
        EntityManager {
            id: entityManager
            entityContainer: level3
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

            source: "../../assets/BG.jpg"
        }
        Image {
            id: player
            x: parent.width/2
            y: 560
            source: "../../assets/Knife.png"
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
                    RotationAnimation on rotation {
                        id:rot
                        from: 0
                        to:360
                        duration: rotspeed
                        running: true
                        loops: Animation.Infinite
                    }

                }

                y: 60

                NumberAnimation on x {
                    from: -level3.width
                    to: level3.width
                    duration: speed




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
                    onStopped: {
                        if(!win3){
                        health2--}
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
                if(winlevel3.visible){
                    var Component =Qt.createComponent("game4.qml")
                        var window =Component.createObject(gameWindow)
                        level3.visible=false
                        window.show


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
            text: "health: " + health2

            font.family: "Anton"
            font.pointSize: 24
            x:830
            y:10

            color: "white"

        }
        Text {
            id: winlevel3
            text: qsTr("Now You In Level 4")
            x:340
            y:280
            color: "white"
            font.pointSize: 24
            visible: false


        }
        Timer {
            running: level3.visible == true
            repeat: true
            interval: 1000
            onTriggered: addTarget()
        }
        function addTarget() {
            entityManager.createEntityFromComponent(chiken)
        }




}

