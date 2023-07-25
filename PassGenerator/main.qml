import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.0

import "components"

Window {
    id: window
    width: 640
    height: 605
    visible: true
    color: "#00000000"
    title: qsTr("PassGenerator")

    flags: Qt.FramelessWindowHint | Qt.Window

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
            id: text6
            x: 261
            y: 214
            width: 328
            height: 74
            visible: false
            color: "#12df53"
            text: qsTr("dfgfdgdfggnb")
            font.pixelSize: 45
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.italic: false
            font.underline: false
            anchors.horizontalCenter: parent.horizontalCenter

        }

        MouseArea {
            id: mouseArea
            x: 156
            y: 214
            width: 328
            height: 74
            onClicked: {
                Generato.copyBuffer();
                text6.text = "Copied!";
            }
        }




    }


    Text {
        id: text1
        x: 108
        y: 57
        width: 424
        height: 113
        visible: false
        color: "#fbfbfb"
        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Titillium Web'; font-size:8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Titillium Web','Segoe UI Variable Display Semib'; font-size:48pt; color:#12df53;\">PassGenerator</span></p></body></html>"
        font.pixelSize: 68
        textFormat: Text.RichText
        font.family: "Courier"
    }

    Slider {
        id: slider
        x: 220
        y: 510
        orientation: Qt.Horizontal
        hoverEnabled: true
        wheelEnabled: false
        stepSize: 1
        to: 15
        from: 1
        snapMode: Slider.NoSnap
        value: 1

        Text {
            id: text2
            x: 36
            y: 34
            color: "#12df53"
            text: "Length: " + slider.value
            font.pixelSize: 30
        }
    }

    CustomButton {
        id: customButton
        x: 220
        y: 380
        width: 212
        height: 36
        text: "Generate"
        font.pointSize: 15
        checkable: false
        colorPressed: "#145f38"
        colorMouseOver: "#12ae43"
        colorDefault: "#12df53"
        onPressed: {
            text6.text = Generato.generate(switch1.checked, switch2.checked, slider.value);
            text6.visible = true;
        }
    }

    Switch {
        id: switch2
        x: 345
        y: 462
        text: qsTr("")
        Text {
            id: text5
            x: -99
            y: 4
            width: 99
            height: 32
            color: "#12df53"
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Titillium Web'; font-size:8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Black'; font-size:16pt;\">Numbers</span></p></body></html>"
            font.pixelSize: 25
            textFormat: Text.RichText
        }
        display: AbstractButton.IconOnly
    }

    Switch {
        id: switch1
        x: 345
        y: 426
        text: qsTr("")
        display: AbstractButton.IconOnly

        Text {
            id: text4
            x: -99
            y: 4
            width: 99
            height: 32
            color: "#12df53"
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Titillium Web'; font-size:8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Black','Segoe UI Semibold'; font-size:18pt;\">Symbols</span></p></body></html>"
            font.pixelSize: 25
            textFormat: Text.RichText
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
            target: text1
            property: "y"

            Keyframe {
                value: -81
                frame: 500
            }

            Keyframe {
                value: 57
                easing.bezierCurve: [0.816,0.00671,0.204,0.997,1,1]
                frame: 1000
            }
        }

        KeyframeGroup {
            target: text1
            property: "visible"
            Keyframe {
                value: false
                frame: 499
            }

            Keyframe {
                value: true
                frame: 500
            }

            Keyframe {
                value: false
                frame: 0
            }
        }

        KeyframeGroup {
            target: slider
            property: "y"

            Keyframe {
                frame: 500
                value: 606
            }

            Keyframe {
                frame: 1000
                value: 510
                easing.bezierCurve: [0.604,-0.00815,0.399,0.997,1,1]
            }

            Keyframe {
                frame: 0
                value: 606
            }
        }

        KeyframeGroup {
            target: customButton
            property: "x"

            Keyframe {
                frame: 0
                value: -218
            }

            Keyframe {
                frame: 500
                value: -218
            }

            Keyframe {
                frame: 1000
                value: 220
                easing.bezierCurve: [0.805,-0.00287,0.183,0.994,1,1]
            }
        }

        KeyframeGroup {
            target: switch1
            property: "x"

            Keyframe {
                frame: 0
                value: 750
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.333,0,0.667,1,1,1]
                value: 745
            }

            Keyframe {
                frame: 1000
                easing.bezierCurve: [0.58,-0.00825,0.386,0.997,1,1]
                value: 345
            }
        }



        KeyframeGroup {
            target: switch2
            property: "x"

            Keyframe {
                frame: 0
                value: 750
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.333,0,0.667,1,1,1]
                value: 745
            }

            Keyframe {
                frame: 1000
                easing.bezierCurve: [0.58,-0.00825,0.386,0.997,1,1]
                value: 345
            }
        }

        KeyframeGroup {
            target: mouseArea1
            property: "x"

            Keyframe {
                frame: 0
                value: 656
            }

            Keyframe {
                frame: 500
                value: 656
            }

            Keyframe {
                frame: 1000
                easing.bezierCurve: [0.6,-0.00543,0.385,0.995,1,1]
                value: 469
            }
        }
    }

    Timeline {
        id: timelinenazad
        animations: [
            TimelineAnimation {
                id: timelineAnimationaz
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
            target: text1
            property: "y"

            Keyframe {
                value: 57
                frame: 0
            }

            Keyframe {
                value: -81
                easing.bezierCurve: [0.816,0.00671,0.204,0.997,1,1]
                frame: 500
            }
        }

        KeyframeGroup {
            target: text1
            property: "visible"
            Keyframe {
                value: true
                frame: 0
            }

            Keyframe {
                value: false
                frame: 500
            }
        }

        KeyframeGroup {
            target: slider
            property: "y"

            Keyframe {
                frame: 0
                value: 510
            }

            Keyframe {
                frame: 500
                value: 606
                easing.bezierCurve: [0.604,-0.00815,0.399,0.997,1,1]
            }
        }

        KeyframeGroup {
            target: customButton
            property: "x"

            Keyframe {
                frame: 0
                value: 220
            }

            Keyframe {
                frame: 500
                value: -218
                easing.bezierCurve: [0.805,-0.00287,0.183,0.994,1,1]
            }
        }

        KeyframeGroup {
            target: switch1
            property: "x"

            Keyframe {
                frame: 0
                value: 345
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.58,-0.00825,0.386,0.997,1,1]
                value: 750
            }
        }



        KeyframeGroup {
            target: switch2
            property: "x"

            Keyframe {
                frame: 0
                value: 345
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.58,-0.00825,0.386,0.997,1,1]
                value: 750
            }
        }

        KeyframeGroup {
            target: mouseArea1
            property: "x"

            Keyframe {
                frame: 0
                value: 469
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.6,-0.00543,0.385,0.995,1,1]
                value: 656
            }
        }
    }

    Loader {
           id: myLoader

        }

    MouseArea {
        id: mouseArea1
        x: 469
        y: 548
        width: 158
        height: 42
        hoverEnabled: true

        onHoveredChanged:
        {
            if (containsMouse)
            {
                rectangle1.color = "#403d3d";
            }
            else
            {
                rectangle1.color = "#302e2e";
            }
        }

        onPressed:
        {
            rectangle1.color = "#242222";
        }
        onReleased:
        {
            text6.visible = false;
            timelinenazad.enabled = true;
            timelineAnimationaz.running = true;
            fd.running = true;
        }

        Timer {
                id: fd
                interval: 1000; running: false;
                onTriggered:
                {
                    myLoader.source = "pass.qml";
                    window.hide();
                }

        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 158
            height: 42
            color: "#302e2e"
            radius: 15
            border.color: "#4df447"
            border.width: 2

            Text {
                id: text7
                x: 18
                y: 0
                width: 122
                height: 42
                visible: true
                color: "#fbfbfb"
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Titillium Web'; font-size:8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Titillium Web','Segoe UI Variable Display Semib'; font-size:20pt; color:#12df53;\">PassSaver</span></p></body></html>"
                font.pixelSize: 20
                textFormat: Text.RichText
                font.family: "Courier"
            }
        }
    }

    MouseArea {
        id: mouseArea2
        x: 469
        y: 497
        width: 151
        height: 40
        visible: false
        Timer {
            id: fd1
            interval: 1000
            running: false
        }

        Rectangle {
            id: rectangle2
            x: 0
            y: 0
            width: 158
            height: 42
            color: "#302e2e"
            radius: 15
            border.color: "#4df447"
            border.width: 2
            Text {
                id: text8
                x: 18
                y: 0
                width: 122
                height: 42
                visible: true
                color: "#fbfbfb"
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Titillium Web'; font-size:8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Titillium Web','Segoe UI Variable Display Semib'; font-size:20pt; color:#12df53;\">Save pass</span></p></body></html>"
                font.pixelSize: 20
                font.family: "Courier"
                textFormat: Text.RichText
            }
        }
        hoverEnabled: true
    }










}
