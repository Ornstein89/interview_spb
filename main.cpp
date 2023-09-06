#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <modelsaverloader.h>
#include <translation.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    ModelCommands * modelCommands = new ModelCommands();
    modelCommands->loadFromJson("file.json");
    Translation translation;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("modelCommands", modelCommands);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("2023_09_interview_spb", "Main");
    QObject::connect(engine.rootObjects().first(),
                     SIGNAL(signalAppend(QString, QString)),
                     modelCommands,
                     SLOT(append(QString,QString)));
    QObject::connect(engine.rootObjects().first(),
                     SIGNAL(signalTranslate(QString)),
                     &translation,
                     SLOT(setTranslation(QString)));
    QObject::connect(&translation, SIGNAL(languageChanged()),
                     &engine, SLOT(retranslate()));
    return app.exec();
}
