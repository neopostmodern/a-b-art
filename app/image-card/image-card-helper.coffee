if Meteor.isClient
  Template.image_card.events(
    'dblclick .card-image': ->
      Router.go 'image', _id: @_id
  )
