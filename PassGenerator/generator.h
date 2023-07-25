#ifndef GENERATOR_H
#define GENERATOR_H

#include <QObject>
#include <QtDebug>
#include <string>
#include <Windows.h>
#include <QFile>
#include <QDataStream>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlTableModel>
#include <Lmcons.h>

using namespace std;
class Generator : public QObject
{
    Q_OBJECT
public:
    explicit Generator(QObject *parent = nullptr);

signals:

public slots:
    QString generate(bool symbols, bool numbers, int size);
    void write(QString name, QString password);
    void copyBuffer();
    QString readPass();
    QString readName();
    void start();
    void stop();
    void copyBufferPass(QString pass);
    void messageCopy();
    bool messageSure();
    bool next();
};

#endif // GENERATOR_H
