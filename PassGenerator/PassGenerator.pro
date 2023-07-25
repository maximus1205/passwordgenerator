QT += quick sql

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        generator.cpp \
        main.cpp

RESOURCES += qml.qrc

VERSION = 2.0.1
QMAKE_TARGET_COMPANY = Maksim Golikov
QMAKE_TARGET_PRODUCT = PasswordGenerator
QMAKE_TARGET_DESCRIPTION = Application for creating a secure password and storing it.
QMAKE_TARGET_COPYRIGHT = Maksim Golikov

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RC_ICONS = images/zxczxcczxzxc.ico

HEADERS += \
    generator.h
