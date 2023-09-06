#include "translation.h"
#include <QGuiApplication>

Translation::Translation(QObject *parent)
    : QObject{parent}
{

}

void Translation::setTranslation(QString translation)
{
    qDebug() << "***QTranslator.load() " << m_translator.load(translation);
    qApp->installTranslator(&m_translator);
    qDebug() << "***languageChanged";
    emit languageChanged();
}
