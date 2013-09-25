class Radiator.Router extends Backbone.Router
  routes:
    'show': 'show'
    '': 'index'
  
  initialize: (options)->
    @fetchModel options.collection
    @el = options.el
  
  index: ->
    console.log 'router index'
    @indexView = new Radiator.Views.Setup({collection: @collection, el: @el})

  show: ->
    console.log 'router show'
    @show = new Radiator.Views.Show({collection: @collection, el: @el})
  
  fetchModel: (collection)->
    @collection = if collection then new Radiator.Programs(collection) else new Radiator.Programs()

