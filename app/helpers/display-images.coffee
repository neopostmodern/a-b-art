@GetPathForImageFileId = (imageFileId) ->
  image = ImageFiles.findOne imageFileId
  return image.url()

if Meteor.isClient
  Template.registerHelper('imgsrc', @GetPathForImageFileId)
  Template.registerHelper('imgname', (imageFileId) ->
    image = ImageFiles.findOne imageFileId
    return image.name()
  )