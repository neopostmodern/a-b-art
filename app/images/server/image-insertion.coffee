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

    tx.start("Insert image (#{image.fileId})")

    imageDocument = Images.insert image, tx: true

    tx.commit()

    return imageDocument
)