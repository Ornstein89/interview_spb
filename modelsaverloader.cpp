#include "modelsaverloader.h"

#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

Command::Command(const QString &name, const QString &image)
    :m_name(name), m_image(image)
{

}

QString Command::name() const
{
    return m_name;
}

QString Command::image() const
{
    return m_image;
}

ModelCommands::ModelCommands(QObject *parent)
: QAbstractListModel(parent)
{

}

void ModelCommands::addCommand(const Command &command)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_commands << command;
    endInsertRows();
    this->saveToJson();
}

int ModelCommands::rowCount(const QModelIndex &parent) const
{
    return m_commands.count();
}

QVariant ModelCommands::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_commands.count())
        return QVariant();

    const Command &command = m_commands[index.row()];
    if (role == NameRole)
        return command.name();
    else if (role == ImageRole)
        return command.image();
    return QVariant();
}

void ModelCommands::saveToJson(const QString & fileName)
{
    QJsonArray commands;
    for(const Command & item : m_commands){
        QJsonObject jsonItem;
        jsonItem["name"] = item.name();
        jsonItem["image"] = item.image();
        commands.append(jsonItem);
    }
    QJsonObject rootObject;
    rootObject["commands"] = commands;
    QJsonDocument jsonDoc;
    jsonDoc.setObject(rootObject);
    QFile jsonFile(fileName);
    if(!jsonFile.open(QFile::WriteOnly))
        return;
    jsonFile.write(jsonDoc.toJson());
    jsonFile.close();
}

void ModelCommands::loadFromJson(const QString & fileName)
{
    QFile jsonFile(fileName);
    if(!jsonFile.open(QFile::ReadOnly))
        return;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonFile.readAll());
    jsonFile.close();
    QJsonObject rootObject = jsonDoc.object();
    QJsonArray commands = rootObject["commands"].toArray();
    for(auto item : commands){
        m_commands.append(Command(
            item.toObject()["name"].toString(),
            item.toObject()["image"].toString()));
    }
}

void ModelCommands::append(const QString &name, const QString &image)
{
    addCommand(Command(name, image));
}

QHash<int, QByteArray> ModelCommands::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ImageRole] = "image";
    return roles;
}
