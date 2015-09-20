@LogRouteController = RouteController.extend(
  template: 'log'
  data: ->
    logEntries: tx.Transactions.find()
)


LogRouteController.events(
)

LogRouteController.helpers(
  getImage: (items) ->
    GetPathForImageFileId items.inserted[0].newDoc.fileId
)

Router.route 'log',
  path: 'log'
  controller: 'LogRouteController'