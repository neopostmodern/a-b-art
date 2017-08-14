@HomeRouteController = RouteController.extend(
  template: 'home'
  subscriptions: -> [
    Meteor.subscribe Projects.SUBSCRIPTIONS.USER
  ]
  data: ->
    return projects: Projects.find()
)

Router.route 'home',
  path: '/'
  controller: 'HomeRouteController'