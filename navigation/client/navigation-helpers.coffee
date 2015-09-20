Template.navigation.helpers(
  isActiveRoute: (routeName) -> Router.current().route.getName() is routeName
  projects: -> Projects.find()
  activeProject: -> Projects.findOne(Meteor.user()?.profile.activeProject)
)

Template.navigation.onRendered -> @$(".dropdown-button").dropdown()

Template.navigation.events(
  'click #project-selection-dropdown a': (event, template) ->
    Meteor.users.update(Meteor.user()._id, { $set: { 'profile.activeProject': @_id }})
)