@Groups = new Mongo.Collection 'groups'

if Meteor.isServer
  Meteor.publish null, ->
    Meteor.roles.find({})
  Meteor.publish 'groups', ->
    Groups.find({})