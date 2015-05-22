if Meteor.isClient
  Template.image_list.onRendered ->
    # the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    @$('.modal-trigger').leanModal()


    @$('#image-upload-zone').on 'dragenter', (event) ->
      Router.current().state.set 'uploadZoneStatus', 'hover'
    @$('#image-upload-zone').on 'dragleave', (event) ->
      Router.current().state.set 'uploadZoneStatus', null

    @$('#image-upload-zone').on 'dragover', (event) ->
      # this seems to be REALLY important to make the area a drop target:
      # https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Drag_operations#droptargets
      event.preventDefault()

#    @$('#image-upload-zone').on 'drop', (event) ->
#
#      console.dir event
#      console.dir event.dataTransfer
#      event.stopPropagation()
#      event.preventDefault()
#      Router.current().state.set 'uploadZoneStatus', 'processing'