Meteor.startup ->

  if Meteor.isServer
    if Meteor.users.find().count() is 0
      users = [
        {
          name: "User1"
          email: "user1@gmail.com"
          password: "foobar"
          roles: ["entry", "report"]
        },
        {
          name: "User2"
          email: "user2@gmail.com"
          password: "foobar"
          roles: ["entry", "report"]
        },
        {
          name: "User3"
          email: "user3@gmail.com"
          password: "foobar"
          roles: ["entry", "report"]
        },
        {
          name: "User4"
          email: "user4@gmail.com"
          password: "foobar"
          roles: ["entry", "report"]
        },
        {
          name: "Admin1"
          email: "admin1@gmail.com"
          password: "foobar"
          roles: ["admin", "entry", "report"]
        },
        {
          name: "Admin2"
          email: "admin2@gmail.com"
          password: "foobar"
          roles: ["admin", "entry", "report"]
        }
        {
          name: "SuperAdmin"
          email: "superadmin@gmail.com"
          password: "foobar"
          roles: ["admin", "entry", "report"]
        }
      ]
      _.each users, (user) ->
        id = Accounts.createUser
          email: user.email
          password: user.password
          profile: {
            name: user.name
          }
        if user.name is "User1"
          Roles.addUsersToRoles id, user.roles, 'UnitA'
        if user.name is "User2"
          Roles.addUsersToRoles id, user.roles, 'UnitB'
        if user.name is "User3"
          Roles.addUsersToRoles id, user.roles, 'UnitA'
          Roles.addUsersToRoles id, user.roles, 'UnitB'
          Roles.addUsersToRoles id, user.roles, 'UnitC'
        if user.name is "User4"
          Roles.addUsersToRoles id, user.roles, 'UnitC'

        if user.name is "Admin1"
          Roles.addUsersToRoles id, user.roles, 'UnitA'
          Roles.addUsersToRoles id, ["entry", "report"], 'UnitB'
        if user.name is "Admin2"
          Roles.addUsersToRoles id, user.roles, 'UnitC'
        if user.name is "SuperAdmin"
          Roles.addUsersToRoles id, user.roles, 'Super'

    if Residents.find().count() is 0
      Residents.insert
        name: "Jim"
        unit: "UnitA"
      Residents.insert
        name: "jeff"
        unit: "UnitB"
      Residents.insert
        name: "mary"
        unit: "UnitA"
      Residents.insert
        name: "sally"
        unit: "UnitB"
      Residents.insert
        name: "biff"
        unit: "UnitC"
      Residents.insert
        name: "marty"
        unit: "UnitC"