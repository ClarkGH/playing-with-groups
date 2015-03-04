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
          Roles.addUsersToRoles id, user.roles, 'unitA'
        if user.name is "User2"
          Roles.addUsersToRoles id, user.roles, 'unitB'
        if user.name is "User3"
          Roles.addUsersToRoles id, user.roles, 'unitA'
          Roles.addUsersToRoles id, user.roles, 'unitB'
          Roles.addUsersToRoles id, user.roles, 'unitC'
        if user.name is "User4"
          Roles.addUsersToRoles id, user.roles, 'unitC'

        if user.name is "Admin1"
          Roles.addUsersToRoles id, user.roles, 'unitA'
          Roles.addUsersToRoles id, ["entry", "report"], 'unitB'
        if user.name is "Admin2"
          Roles.addUsersToRoles id, user.roles, 'unitC'
        if user.name is "SuperAdmin"
          Roles.addUsersToRoles id, user.roles, 'super'

    if Residents.find().count() is 0
      Residents.insert
        name: "Jim"
        unit: "unitA"
      Residents.insert
        name: "jeff"
        unit: "unitB"
      Residents.insert
        name: "mary"
        unit: "unitA"
      Residents.insert
        name: "sally"
        unit: "unitB"
      Residents.insert
        name: "biff"
        unit: "unitC"
      Residents.insert
        name: "marty"
        unit: "unitC"