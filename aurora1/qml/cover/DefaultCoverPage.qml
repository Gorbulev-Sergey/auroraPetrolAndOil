import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverTemplate {
        objectName: "applicationCover"
        primaryText: "Калькулятор масла"
        secondaryText: qsTr("Расчёт пропорций масла и бензина")
        icon {
            source: Qt.resolvedUrl("../icons/aurora1.svg")
            sourceSize { width: icon.width; height: icon.height }
        }
    }
}
