#ifndef MODELSAVERLOADER_H
#define MODELSAVERLOADER_H

#include <QObject>

#include <QAbstractListModel>

class Command
{
public:
    Command(const QString &name, const QString &image);

    QString name() const;
    QString image() const;

private:
    QString m_name;
    QString m_image;
};

class ModelCommands :  public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        NameRole = Qt::UserRole + 1,
        ImageRole
    };
    ModelCommands(QObject *parent = nullptr);

    void addCommand(const Command &command);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

public slots:
    void saveToJson(const QString & fileName = "file.json");
    void loadFromJson(const QString &fileName = "file.json");
    void append(const QString &name, const QString &image);

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<Command> m_commands;
};


#endif // MODELSAVERLOADER_H
