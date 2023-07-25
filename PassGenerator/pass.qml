import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15

import "components"

Window {
    id: window
    width: 640
    height: 605
    visible: true
    color: "#00000000"
    title: qsTr("PassGenerator")

    flags: Qt.FramelessWindowHint | Qt.Window

    property int count: 0

    MouseArea {
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 530
        anchors.leftMargin: 0
        anchors.topMargin: 0
        onPressed: {
            window.startSystemMove();
        }
    }

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 640
        height: 479
        color: "#191919"
        radius: 18
        border.color: "#4df447"
        border.width: 2
        anchors.verticalCenter: parent.verticalCenter
        clip: true
        anchors.verticalCenterOffset: 0

        MouseArea {
            id: mouseArea123000
            x: 412
            y: 548
            width: 211
            height: 42
            hoverEnabled: true

            onHoveredChanged:
            {
                if (containsMouse)
                {
                    rectangle17.color = "#403d3d";
                }
                else
                {
                    rectangle17.color = "#302e2e";
                }
            }

            onPressed:
            {
                rectangle17.color = "#242222";
            }
            onReleased:
            {
                timelinezad.enabled = true;
                timelineAnimationzd.running = true;
                fd.running = true;
                Generato.read();
            }
            Loader
            {
                id: myLoader
            }

            Timer {
                id: fd
                interval: 1000; running: false;
                onTriggered:
                {
                    myLoader.source = "main.qml";
                    window.hide();
                }

            }


            Rectangle {
                id: rectangle17
                x: 1
                y: 0
                width: 207
                height: 42
                color: "#302e2e"
                radius: 15
                border.color: "#4df447"
                border.width: 2

                Text {
                    id: text7
                    x: 18
                    y: 0
                    width: 181
                    height: 42
                    visible: true
                    color: "#fbfbfb"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Titillium Web'; font-size:8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Titillium Web','Segoe UI Variable Display Semib'; font-size:20pt; color:#12df53;\">PassGenerator</span></p></body></html>"
                    font.pixelSize: 20
                    textFormat: Text.RichText
                    font.family: "Courier"
                }
            }
        }

        Text {
            id: text3
            x: 8
            y: 583
            color: "#12df53"
            text: qsTr("v2.0.0")
            font.pixelSize: 12
        }

        TopBarButton {
            id: topBarButton1
            x: 596
            y: 7
            btnColorMouseOver: "#12ae43"
            btnColorClicked: "#145f38"
            btnIconSource: "images/close_icon.svg"
            btnColorDefault: "#191919"
            onClicked: {
                Qt.quit();
            }
        }

        TopBarButton {
            id: topBarButton
            x: 555
            y: 7
            btnColorMouseOver: "#12ae43"
            btnColorClicked: "#145f38"
            btnColorDefault: "#191919"
            btnIconSource: "images/minimize_icon.svg"
            onClicked: {
                window.showMinimized();
            }
        }

        Text {
            id: text1
            x: 171
            y: 548
            visible: false
            color: "#df2020"
            text: qsTr("password empty")
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 161
            y: 98
            color: "#4d4d4d"
            text: qsTr("Enter password:")
            font.pixelSize: 44
        }

        CustomTextField {
            id: customTextField1
            x: 169
            y: 273
            width: 302
            height: 35
            font.pointSize: 15
            hoverEnabled: true
            placeholderText: ""
        }

        CustomButton {
            id: customButton6
            x: 249
            y: 450
            width: 142
            height: 29
            text: "Sign"
            font.pointSize: 15
            checkable: false
            colorPressed: "#145f38"
            colorMouseOver: "#12ae43"
            colorDefault: "#12df53"
            onPressed: {
                if (customTextField1.text != "Jopa123")
                {
                    rectangle.border.color = "#ff0019";
                    color2.running = true;
                    return;
                }
                timelinezad.enabled = true;
                timelineAnimationzd.running = true;
                anim.running = true;
            }
        }

        Timer {
            id: anim
            interval: 1000; running: false;
            onTriggered:
            {
                myLoader.source = "passsaver.qml";
                window.hide();
            }
        }



        Timer {
            id: color2
            interval: 200; running: false;
            onTriggered:
            {
                rectangle.border.color = "#4df447";
            }
        }







    }


    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: 1
                duration: 1000
                running: true
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: rectangle
            property: "height"

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 605
                easing.bezierCurve: [0.799,0.00629,0.201,0.994,1,1]
                frame: 500
            }
        }

        KeyframeGroup {
            target: mouseArea123000
            property: "x"

            Keyframe {
                frame: 0
                value: 649
            }

            Keyframe {
                frame: 500
                value: 649
            }

            Keyframe {
                frame: 1000
                easing.bezierCurve: [0.809,-0.00575,0.167,1.02,1,1]
                value: 412
            }
        }


    }

    Timeline {
        id: timelinezad
        animations: [
            TimelineAnimation {
                id: timelineAnimationzd
                loops: 1
                duration: 1000
                running: false
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        enabled: false
        startFrame: 0

        KeyframeGroup {
            target: rectangle
            property: "height"

            Keyframe {
                value: 605
                frame: 500
            }

            Keyframe {
                value: 0
                easing.bezierCurve: [0.799,0.00629,0.201,0.994,1,1]
                frame: 1000
            }
        }

        KeyframeGroup {
            target: mouseArea123000
            property: "x"

            Keyframe {
                frame: 0
                value: 412
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.809,-0.00575,0.167,1.02,1,1]
                value: 649
            }
        }


    }

    Timeline {
        id: timeline4
        animations: [
            TimelineAnimation {
                id: timelineAnimation5
                loops: 1
                duration: 1000
                running: false
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        enabled: false
        startFrame: 0

        KeyframeGroup {
            target: rectangle
            property: "height"

            Keyframe {
                value: 605
                frame: 0
            }

            Keyframe {
                value: 0
                easing.bezierCurve: [0.799,0.00629,0.201,0.994,1,1]
                frame: 500
            }
        }


    }










}
