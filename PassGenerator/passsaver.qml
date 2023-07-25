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

    property string rect1N: ""
    property string rect1P: ""

    property string rect2N: ""
    property string rect2P: ""

    property string rect3N: ""
    property string rect3P: ""

    property string rect4N: ""
    property string rect4P: ""

    property string rect5N: ""
    property string rect5P: ""

    property string rect6N: ""
    property string rect6P: ""


    property string rect7N: ""
    property string rect7P: ""

    property string rect8N: ""
    property string rect8P: ""

    property string rect9N: ""
    property string rect9P: ""

    property string rect10N: ""
    property string rect10P: ""

    property string rect11N: ""
    property string rect11P: ""

    property string rect12N: ""
    property string rect12P: ""

    property string rect13N: ""
    property string rect13P: ""

    property string rect14N: ""
    property string rect14P: ""

    property string rect15N: ""
    property string rect15P: ""

    property string rect16N: ""
    property string rect16P: ""

    property string rect17N: ""
    property string rect17P: ""

    property string rect18N: ""
    property string rect18P: ""

    property string rect19N: ""
    property string rect19P: ""

    property string rect20N: ""
    property string rect20P: ""

    property string rect21N: ""
    property string rect21P: ""

    property string rect22N: ""
    property string rect22P: ""

    property string rect23N: ""
    property string rect23P: ""

    property string rect24N: ""
    property string rect24P: ""

    property string rect25N: ""
    property string rect25P: ""

    property string rect26N: ""
    property string rect26P: ""

    property string rect27N: ""
    property string rect27P: ""

    property string rect28N: ""
    property string rect28P: ""

    property string rect29N: ""
    property string rect29P: ""

    property string rect30N: ""
    property string rect30P: ""

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

    Timer {
        id: nach
        interval: 1; running: true; repeat: false;
        onTriggered:
        {
            check();
        }

    }

    function check()
    {
        Generato.start();

        while (Generato.next())
        {
            var newMsg = {};
            newMsg.pass = Generato.readPass();
            newMsg.name = Generato.readName();
            listModel.append(newMsg);
        }

        Generato.stop();
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

        CustomButton {
            id: customButton7
            x: 59
            y: 580
            width: 83
            height: 20
            text: "Reset"
            font.pointSize: 11
            colorPressed: "#7c0c0c"
            colorDefault: "#df1212"
            checkable: false
            colorMouseOver: "#ed2727"

            onReleased: {
                if(Generato.messageSure() == true)
                {
                    check();
                }
            }

        }

        CustomTextField {
            id: customTextField1
            x: 166
            y: 506
            width: 167
            height: 37
            placeholderText: "Password"
        }

        CustomButton {
            id: customButton6
            x: 348
            y: 481
            width: 123
            height: 38
            text: "Save"
            font.pointSize: 15
            checkable: false
            colorPressed: "#145f38"
            colorMouseOver: "#12ae43"
            colorDefault: "#12df53"
            onPressed: {

                if (customTextField1.text == "" && customTextField.text == "")
                {
                    text1.visible = true;
                    text1.text = "password and name empty";
                    return;
                }

                if (customTextField.text == "")
                {
                    text1.visible = true;
                    text1.text = "name empty";
                    return;
                }

                if (customTextField1.text == "")
                {
                    text1.visible = true;
                    text1.text = "password empty";
                    return;
                }
                text1.visible = false;
                Generato.write(customTextField.text, customTextField1.text);
                check();
                customTextField.text = "";
                customTextField1.text = "";

            }
        }

        CustomTextField {
            id: customTextField
            x: 166
            y: 463
            width: 167
            height: 37
            placeholderText: "Name"
        }

        Text {
            id: text2
            x: 418
            y: 452
            color: "#696767"
            text: qsTr("max: 30")
            font.pixelSize: 13
        }








    }


    Rectangle {
        id: rectangle1
        x: 158
        y: 58
        width: 318
        height: 391
        color: "#00000000"
        radius: 20
        border.color: "#4df447"
        border.width: 0
        clip: true


            ListView
            {
                id: listview
                anchors.fill: parent
                anchors.leftMargin: 22
                anchors.topMargin: 20
                anchors.rightMargin: 22
                anchors.bottomMargin: 39
                spacing: 6
                model: listModel

                delegate: Rectangle
                {
                    id: rec7
                    width: 276
                    height: 66
                    color: "#323030"
                    radius: 10
                    border.color: "#4df447"
                    border.width: 2
                    Text {
                        id: password6
                        x: 13
                        y: 32
                        color: "#cac9c9"
                        text: qsTr("Password:")
                        font.pixelSize: 20
                    }

                    Text {
                        x: 110
                        y: 32
                        color: "#ffffff"
                        text: model.pass
                        font.pixelSize: 20
                    }

                    Text {
                        id: name6
                        x: 13
                        y: 8
                        color: "#cac9c9"
                        text: qsTr("Name:")
                        font.pixelSize: 20
                    }

                    Text {
                        x: 78
                        y: 8
                        color: "#ffffff"
                        text: model.name
                        font.pixelSize: 20
                    }

                    MouseArea {
                        x: 0
                        y: 0
                        width: 281
                        height: 66

                        hoverEnabled: true
                        onHoveredChanged:
                        {
                            if (containsMouse)
                            {

                                parent.color = "#383535";
                            }
                            else
                            {
                                parent.color = "#323030";
                            }
                        }
                        onPressed: {
                            parent.color = "#575252";
                            Generato.copyBufferPass(model.pass);
                        }
                        onReleased: {
                            parent.color = "#383535";
                            Generato.messageCopy();
                        }
                    }
                }

                ListModel
                {
                    id: listModel;
                 }
        }

        Rectangle {
            id: rectangle2
            x: 0
            y: 0
            width: 318
            height: 391
            color: "#00000000"
            radius: 20
            border.color: "#4df447"
            border.width: 3
            clip: true
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

        KeyframeGroup {
            target: rectangle1
            property: "y"

            Keyframe {
                frame: 0
                value: -417
            }

            Keyframe {
                frame: 500
                value: -417
            }

            Keyframe {
                frame: 998
                easing.bezierCurve: [0.618,0.00296,0.378,1,1,1]
                value: 58
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

        KeyframeGroup {
            target: rectangle1
            property: "y"

            Keyframe {
                frame: 0
                value: 58
            }

            Keyframe {
                frame: 500
                easing.bezierCurve: [0.618,0.00296,0.378,1,1,1]
                value: -417
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
