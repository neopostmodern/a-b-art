@ImageRouteController = RouteController.extend(
  template: 'image'
  data: ->
    image = Images.findOne @params._id

    data =
      image: image

    if image?.inferior?
      data.inferiorImages = Images.find _id: $in: image.inferior
    if image?.superior?
      data.superiorImage = Images.findOne image.superior

    return data
)

Router.route 'image',
  path: 'image/:_id'
  controller: 'ImageRouteController'