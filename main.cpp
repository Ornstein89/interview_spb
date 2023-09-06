#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <modelsaverloader.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    ModelCommands * modelCommands = new ModelCommands();
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("modelCommands", modelCommands);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("2023_09_interview_spb", "Main");

    return app.exec();
}
