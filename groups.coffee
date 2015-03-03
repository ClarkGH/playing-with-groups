if Meteor.isClient
  Meteor.subscribe('residents');

  # counter starts at 0
  Session.setDefault "counter", 0
  Template.hello.helpers counter: ->
    Session.get "counter"

  Template.hello.events "click button": ->

    # increment the counter when button is clicked
    Session.set "counter", Session.get("counter") + 1
  Template.residents.helpers
    allResidents: ->
      Residents.find({})
# code to run on server at startup