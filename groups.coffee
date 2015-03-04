if Meteor.isClient
  Meteor.subscribe('residents');

  Template.stuff.helpers
    allResidents: ->
      Residents.find({})
    unitAResidents: ->
      console.log 'hi'
      Residents.find( {unit: 'unitA' } )
    unitBResidents: ->
      Residents.find({unit: 'unitB' } )
    unitCResidents: ->
      Residents.find({unit: 'unitC' } )

# code to run on server at startup