CREATE TABLE IF NOT EXISTS User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS Goal (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    userId INTEGER,
    FOREIGN KEY (userId) REFERENCES User(id)
);

CREATE TABLE IF NOT EXISTS GoalDay (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME,
    madeProgress INTEGER,
    goalId INTEGER,
    FOREIGN KEY (goalId) REFERENCES Goal(id)
);

CREATE TABLE IF NOT EXISTS DailyDiscipline (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    goalId INTEGER,
    FOREIGN KEY (goalId) REFERENCES Goal(id)
);

CREATE TABLE IF NOT EXISTS CompletedDailyDiscipline (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dailyDisciplineId INTEGER,
    goalDayId INTEGER,
    FOREIGN KEY (dailyDisciplineId) REFERENCES DailyDiscipline(id),
    FOREIGN KEY (goalDayId) REFERENCES GoalDay(id)
);