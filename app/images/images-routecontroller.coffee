@ImageListRouteController = RouteController.extend(
  template: 'image_list'
  data: ->
    images: Images.find({}, sort: rating: -1)
)

_uploadImage = (files) ->
  for file in files
    ImageFiles.insert file, (error, fileObj) ->
      # Inserted new doc with ID fileObj._id, and kicked off the data upload using HTTP

      if error?
        Materialize.toast error, 4000, "red"
        return

      Meteor.call 'ab.insert-image', { fileId: fileObj._id }, (error, result) ->
        if error?
          Materialize.toast error, 4000, "red"
          return

        Materialize.toast "Successfully added image", 2000


ImageListRouteController.events(
  'change input.image-upload': (event, template) ->
    _uploadImage(event.target.files)

  'drop #image-upload-zone': (event, template) ->
    event.stopPropagation()
    event.preventDefault()
    @state.set 'uploadZoneStatus', 'processing'

    _uploadImage (event.dataTransfer ? event.originalEvent.dataTransfer).files
)

ImageListRouteController.helpers(
  isUploadZoneStatus: (status) -> @state.get('uploadZoneStatus') is status
)

Router.route 'imageList',
  path: 'images'
  controller: 'ImageListRouteController'