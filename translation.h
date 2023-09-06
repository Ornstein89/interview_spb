#ifndef TRANSLATION_H
#define TRANSLATION_H

#include <QObject>
#include <QTranslator>

// на основе https://www.evileg.com/ru/post/198/ и
// https://wiki.qt.io/How_to_do_dynamic_translation_in_QML

class Translation : public QObject
{
    Q_OBJECT
public:
    explicit Translation(QObject *parent = nullptr);

signals:
    void languageChanged();

public:
    Q_INVOKABLE void setTranslation(QString translation);

private:
    QTranslator m_translator;
};

#endif // TRANSLATION_H
