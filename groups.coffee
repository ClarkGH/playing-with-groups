if Meteor.isClient
  Meteor.subscribe('residents');

  Template.residents.helpers
    allResidents: ->
      Residents.find({})
    unitAResidents: ->
      Residents.find({field: {unit: "unitA"} } )

# code to run on server at startup