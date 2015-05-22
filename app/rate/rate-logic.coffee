LEFT = 0
RIGHT = 1

@RateController = RouteController.extend(
  template: 'rate'
  data: ->
    images:
      Images.find({ superior: null }, limit: 2).fetch()

  onAfterAction: ->
    $('body').on('keypress', (event) =>
      if event.type is 'keypress'
        if event.key is 'ArrowLeft'
          @state.set 'selectedId', @data().images[LEFT]._id
        if event.key is 'ArrowRight'
          @state.set 'selectedId', @data().images[RIGHT]._id

        if event.key is 'Enter'
          $('#image-rate-submission').click()
    )

  onStop: ->
    $('body').off('keypress')
)

RateController.helpers(
  isAllRated: -> @data().images.length < 2

  isSelected: (_id) ->
    return _id is @state.get 'selectedId'

  isNoneSelected: ->
    selectedId = @state.get 'selectedId'
    return not selectedId?

  isProcessing: -> @state.get 'isProcessing'
)

RateController.events(
  'click .card.image-rating .card-image': (event, template, data) ->
    @state.set 'selectedId', data._id

  'click #image-rate-submission': ->
    selectedId = @state.get 'selectedId'
    if not selectedId?
      Materialize.toast 'Select an image!', 4000
      return

    @state.set 'isProcessing', true

    inferiorImage = Router.current().data().images.filter((image) -> image._id isnt selectedId)[0]

    Meteor.apply('submitRating', [selectedId, inferiorImage._id], (error, result) =>
      Meteor.setTimeout(=>
        @state.set 'isProcessing', false
        if error?
          Materialize.toast error, 4000, "red"
      , 1000)
    )
)

Router.route 'rate',
  path: 'rate'
  controller: 'RateController'