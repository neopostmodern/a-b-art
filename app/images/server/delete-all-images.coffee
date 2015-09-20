Meteor.methods(
  'ab.delete-all-images': ->
    #todo: authentication

    Images.find().forEach (image) ->
      console.dir image
)