#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <generator.h>
#include <ctime>
int main(int argc, char *argv[])
{
    srand(time(0));
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    Generator genClass;

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("Generato", &genClass);

    return app.exec();
}
