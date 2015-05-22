if Meteor.isClient
  Template.registerHelper('imgsrc', (imageFileId) ->
    image = ImageFiles.findOne imageFileId
    return image.url()
  )
  Template.registerHelper('imgname', (imageFileId) ->
    image = ImageFiles.findOne imageFileId
    return image.name()
  )