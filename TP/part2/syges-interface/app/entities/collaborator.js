var db = require('./mysql_database');

exports.getInformation = function(username, done) {

    var query = "SELECT User.id, User.firstName, User.lastName, UserEmail.email, Establishment.label AS establishment, Establishment.id AS establishment_code, Company.label AS company, Establishment.companyId AS company_code, User.resourceCategory, User.resourceType, (SELECT Role.label " +
                    "FROM User_ManagerRole " +
                    "INNER JOIN ManagerRole ON User_ManagerRole.managerRoleId = ManagerRole.id " +
                    "INNER JOIN Role ON ManagerRole.roleId = Role.id " +
                    "WHERE User_ManagerRole.UserId = User.id) AS manager " +
                "FROM User " +
                "INNER JOIN UserEmail ON User.id = UserEmail.userId " +
                "INNER JOIN Establishment ON User.establishmentId = Establishment.id " +
                "INNER JOIN Company ON Establishment.companyId = Company.id " +
                "WHERE UserEmail.email = ? AND UserEmail.type = 'WORK';";

    db.get().query(query, username, function(error, rows) {

        if (error) return done(error);
        done(rows[0]);
    });

};

exports.getManagerInformation = function(id, done) {

    var query = "SELECT Role.label AS role, Role.id AS role_code, Agency.label AS agency, Agency.code AS agency_code, Company.label AS company, Company.id AS company_code " +
                "FROM User " +
                "INNER JOIN ManagerRole ON User.id = ManagerRole.managerId " +
                "INNER JOIN Role ON ManagerRole.roleId = Role.id " +
                "LEFT JOIN Manager_Agency ON User.id = Manager_Agency.managerId " +
                "LEFT JOIN Agency ON Manager_Agency.agencyId = Agency.id " +
                "LEFT JOIN Company ON Agency.companyId = Company.id " +
                "WHERE User.id = ?;";

    db.get().query(query, id, function(error, rows) {

        if (error) return done(error);
        done(rows);
    });

};

exports.getPassword = function(login, done) {

    var query = "SELECT User.password " +
                "FROM UserEmail " +
                "INNER JOIN User ON UserEmail.userId = User.id " +
                "WHERE UserEmail.email = ? AND UserEmail.type = 'WORK';";

    db.get().query(query, login, function(error, rows) {

        if (error) return done(error);
        done(rows[0]);
    });

};
