@Projects = new Meteor.Collection 'projects'

Projects.SUBSCRIPTIONS =
  USER: 'ab.subscriptions.user'

if Meteor.isServer
  Meteor.publish Projects.SUBSCRIPTIONS.USER, ->
    Projects.find(user: @userId)