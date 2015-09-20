@HomeRouteController = RouteController.extend(
  template: 'home'
  data: ->
    return projects: Projects.find()
)

Router.route 'home',
  path: '/'
  controller: 'HomeRouteController'