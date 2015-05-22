Meteor.methods(
  'ab.insert-image': (info) ->
    #todo: proper error messages
    if not info?
      return 400

    check info.fileId, String

    image =
      rating: 1
      inferior: []

    image.fileId = info.fileId

    return Images.insert image
)