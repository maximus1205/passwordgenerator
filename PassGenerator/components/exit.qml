import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button6

    // Custom Properties
    property color colorDefault: "#4891d9"
    property color colorMouseOver: "#55AAFF"
    property color colorPressed: "#3F7EBD"

    QtObject{
        id: internal

        property var dynamicColor: if(button6.down){
                                       button6.down ? colorPressed : colorDefault
                                   }else{
                                       button6.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("Button")
    contentItem: Item{
        Text {
            id: name
            text: button6.text
            font: button6.font
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:200}
}
##^##*/
