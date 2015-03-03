Meteor.startup ->
  if Meteor.isServer
    if Meteor.users.find().count() is 0
      users = [
        {
          name: "Jennay"
          email: "jennay@gmail.com"
          password: "jennay"
          roles: ["entry", "report"]
        },
        {
          name: "Forrest"
          email: "forrest@gmail.com"
          password: "forrest"
          roles: ["entry", "report"]
        },
        {
          name: "Matt"
          email: "matt@gmail.com"
          password: "matt"
          roles: ["admin", "entry", "report"]
        },
      ]
      _.each users, (user) ->
        id = Accounts.createUser
          email: user.email
          password: user.password
          profile: {
            name: user.name
          }
        if user.name is "Jennay"
          Roles.addUsersToRoles id, user.roles, 'facA'
        if user.name is "Forrest"
          Roles.addUsersToRoles id, user.roles, 'facB'
        if user.name is "Matt"
          Roles.addUsersToRoles id, user.roles, 'allFac'
          Roles.addUsersToRoles id, user.roles, 'facA'
          Roles.addUsersToRoles id, ["entry", "report"], 'facB'

    if Residents.find().count() is 0
      Residents.insert
        name: "Jim"
        facility: "facA"
      Residents.insert
        name: "jeff"
        facility: "facB"
      Residents.insert
        name: "mary"
        facility: "facA"
      Residents.insert
        name: "sally"
        facility: "facB"