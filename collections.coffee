@Residents = new Mongo.collection 'residents'

if Meteor.isServer
  Meteor.publish null, ->
    Meteor.roles.find({})
  Meteor.publish 'residents', ->
    Residents.find({})