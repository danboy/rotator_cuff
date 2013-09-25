class Radiator.Router extends Backbone.Router
  routes:
    '': 'index'
    'show': 'show'
  
  initialize: (options)->
    @fetchModel options.collection
    @el = options.el
  
  index: ->
    @indexView = new Radiator.Views.Setup({collection: @collection, el: @el})

  show: ->
    @
  
  fetchModel: (collection)->
    @collection = if collection then new Radiator.Programs(collection) else new Radiator.Programs()

