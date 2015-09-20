Meteor.startup ->
  if Meteor.isServer
    if Meteor.users.find().count() is 0
      Accounts.createUser(
        username: 'dummy'
        password: 'dummy'
      )

  if Meteor.isClient
    Meteor.loginWithPassword('dummy', 'dummy')

