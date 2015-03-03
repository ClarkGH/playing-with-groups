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
        if user.name === "Jennay"
          Roles.addUsersToRoles id, user.roles, 'FacA'
        if user.name === "Forrest"
          Roles.addUsersToRoles id, user.roles, 'Facb'
        if user.name === "Matt"
          Roles.addUsersToRoles id, user.roles, 'FacA'
          Roles.addUsersToRoles id, ["entry", "report"], 'FacB'