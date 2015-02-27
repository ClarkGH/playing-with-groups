if Meteor.users.find().count() is 0
  users = [
    {
      name: "Jeeves"
      email: "ask@jeeves.com"
      password: "spoop"
      roles: ["admin"]
      groups: ["FacA"]
    },
    {
      name: "Peeves"
      email: "ask@peeves.com"
      password: "spoop"
      roles: ["admin"]
      groups: ["FacB"]
    }
  ]