Meteor.methods(
  submitRating: (winnerId, loserId) ->
    loser = Images.findOne loserId
    Images.update winnerId,
      $push:
        inferior: loserId
      $inc:
        rating: loser.rating

    Images.update loserId,
      $set:
        superior: winnerId
)