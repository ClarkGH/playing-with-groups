Meteor.startup ->
  if Meteor.isServer
    if Meteor.users.find().count() is 0
      users = [
        {
          name: "Matt Morris"
          email: "matt@visiblehand.io"
          password: "Matt131"
          roles: ["admin"]
        },
        {
          name: "Clark Hinchcliff"
          email: "clarkhinchcliff@gmail.com"
          password: "Nhapp123"
          roles: ["admin", "entry", "report"]
        },
        {
          name: "Harvey Morris"
          email: "hmtucaz@gmail.com"
          password: "Harvey81"
          roles: ["admin", "entry", "report"]
        },
        {
          name: "User Two"
          email: "usertwo@test.com"
          password: "UserTwo222"
          roles: ["entry", "report"]
        },
        {
          name: "User One"
          email: "userone@test.com"
          password: "UserOne111"
          roles: ["entry", "report"]
        },
        {
          name: "Nick"
          email: "nick@test.com"
          password: "Nick149"
          roles: ["entry", "report"]
        }
      ]
      _.each users, (user) ->
        id = Accounts.createUser
          email: user.email
          password: user.password
          profile: {
            name: user.name
          }
        Roles.addUsersToRoles id, user.roles, 'bacon'
      lusers = [
        {
          name: "Jimmy Johns"
          email: "jimmyjohns@gmail.com"
          password: "jimmy"
          roles: ["admin", "entry", "report"]
        },
        {
          name: "Subway"
          email: "subway@gmail.com"
          password: "subway"
          roles: ["admin", "entry", "report"]
        },
      ]
      _.each lusers, (user) ->
        id = Accounts.createUser
          email: user.email
          password: user.password
          profile: {
            name: user.name
          }
        Roles.addUsersToRoles id, user.roles, 'sammich'

      susers = [
        {
          name: "Bilbo"
          email: "bilbobaggins@gmail.com"
          password: "jimmy"
          roles: ["admin", "entry", "report"]
        },
      ]
      _.each susers, (user) ->
        id = Accounts.createUser
          email: user.email
          password: user.password
          profile: {
            name: user.name
          }
        Roles.addUsersToRoles id, user.roles, 'sammich'
        Roles.addUsersToRoles id, user.roles, 'bacon'