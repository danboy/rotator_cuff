class Radiator.Views.Show extends Backbone.View
  initialize: (options)->
    @collection.fetch
      success: (co, res, op)=>
        @render()
  render: ()->
    @$el.html show( programs: @collection.toJSON() )
    @showNextProgram(0)
  showNextProgram: (pointer)->
    console.log(pointer)
    @program = @collection.at pointer
    $('.program-frame').hide()
    $('#'+@program.get('id')).show()
    @setTimer(pointer, @program.get('delay'))
  setTimer: (pointer, delay)->
    if pointer < @collection.length-1 then pointer++ else pointer = 0
    next = @collection.at pointer
    self = @
    setTimeout (=>
      console.log 'in timer'
      @showNextProgram(pointer)
    ), delay
