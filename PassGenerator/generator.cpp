#include "generator.h"

Generator::Generator(QObject *parent) : QObject(parent)
{

}

string eng[] = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z","a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };
string symbjols[] = {"@", "_", "-", "#", "$", "%", "?"};
string numbsk[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

string password = "";
QSqlQuery* query;
QSqlDatabase db;

string filename = "";

QString Generator::generate(bool symbols, bool numbers, int size)
{
    QString pass;
    password = "";
    if(symbols)
    {
        if (numbers)
        {
            for (int i = 0; i < size; i++)
            {
                int rjd = rand() % 3;
                if (rjd == 0)
                {
                    int rd = rand() % 9;
                    password = password + numbsk[rd];
                    continue;
                }

                if (rjd == 1)
                {
                    int rjdk = rand() % 6;
                    password = password + symbjols[rjdk];
                    continue;
                }
                int rd = rand() % 52;
                password = password + eng[rd];
            }
        }
        else
        {
            for (int i = 0; i < size; i++)
            {
                int rjd = 1 + rand() % 2;
                if (rjd % 2 == 0)
                {
                    int rjdk = rand() % 6;
                    password = password + symbjols[rjdk];
                    continue;
                }
                int rd = rand() % 52;
                password = password + eng[rd];
            }
        }
        pass = QString(password.c_str());
        qDebug() << pass;
        return pass;
    }

    if (numbers)
    {
        for (int i = 0; i < size; i++)
        {
            int rjd = 1 + rand() % 2;
            if (rjd % 2 == 0)
            {
                int rjdk = rand() % 9;
                password = password + numbsk[rjdk];
                continue;
            }
            int rd = rand() % 52;
            password = password + eng[rd];
        }

        pass = QString(password.c_str());
        qDebug() << pass;
        return pass;
    }

    for (int i = 0; i < size; i++)
    {
        int rd = rand() % 51;
        password = password + eng[rd];
    }
    pass = QString(password.c_str());
    return pass;

}

QString Generator::readName()
{
    QString name = query->value(0).toString();
    return name;
}

QString Generator::readPass()
{
    QString pass = query->value(1).toString();
    return pass;
}

bool Generator::next()
{
    return query->next();
}

void Generator::messageCopy()
{
    MessageBoxA(0, "Copied!", "PassGenerator", MB_ICONINFORMATION | MB_SYSTEMMODAL);
}

bool Generator::messageSure()
{
    if (MessageBoxA(NULL, "Are you sure?", "PassGenerator",  MB_YESNO | MB_ICONQUESTION) == IDYES)
    {
        remove(filename.c_str());
    }
    return true;
}

void Generator::start()
{
    db = QSqlDatabase::addDatabase("QSQLITE");

    char username[UNLEN+1];
    DWORD username_len = UNLEN+1;
    GetUserNameA(username, &username_len);

    filename = "C:\\Users\\" + string(username) + "\\Documents\\aswrd.db";

    db.setDatabaseName(filename.c_str());



    if (db.open())
    {
        qDebug() << "open";
    }
    query = new QSqlQuery(db);
    query->exec("SELECT name, password FROM PASSWORD");

}

void Generator::stop()
{
    db.close();
    query->clear();
}

void Generator::copyBuffer()
{
    if (OpenClipboard(0))
        {
            EmptyClipboard();
            char* hBuff = (char*)GlobalAlloc(GMEM_FIXED, strlen(password.c_str()) + 1);
            strcpy(hBuff, password.c_str());
            SetClipboardData(CF_TEXT, hBuff);
            CloseClipboard();

        }
}

void Generator::copyBufferPass(QString pass)
{
    if (OpenClipboard(0))
        {
            EmptyClipboard();
            char* hBuff = (char*)GlobalAlloc(GMEM_FIXED, strlen(pass.toStdString().c_str()) + 1);
            strcpy(hBuff, pass.toStdString().c_str());
            SetClipboardData(CF_TEXT, hBuff);
            CloseClipboard();

        }
}

void Generator::write(QString name, QString password)
{
    QSqlDatabase db2;
    db2 = QSqlDatabase::addDatabase("QSQLITE");
    db2.setDatabaseName(filename.c_str());

    if (db2.open())
    {
        qDebug() << "open";
    }
    query = new QSqlQuery(db2);

    query->prepare("INSERT INTO PASSWORD(name, password) VALUES (?, ?);");
    query->addBindValue(name);
    query->addBindValue(password);

    if (!query->exec())
    {
        qDebug() << "pizda";
    }
    stop();
    db2.close();

}
