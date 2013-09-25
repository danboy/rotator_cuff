class Radiator.Views.Setup extends Backbone.View
  events:
    'click button[type=submit]': 'submitForm'
    'click .show': 'showProgram'
    'click .destroy': 'destroyProgram'
  
  initialize: (options)->
    @collection.fetch
      success: (co, res, op)=>
        @render()
    @collection.on 'change', 'render'
 
  showProgram: ()->
    radiator.navigate('show', true) 

  addProgram: (data)->
    @collection.create data

  destroyProgram: (e)->
    window.collection = @collection
    program = @collection.findWhere
      id: $(e.toElement).parent('menu').data('programid')
    @collection.remove program.toJSON(),
      success: ()=>
        console.log 'success'
        @collection.sync()
    console.log @collection

  submitForm: (e)->
    e.preventDefault()
    @serializeForm()
  
  serializeForm: ->
    data = {}
    form = $('#program').serializeArray()
    $(form).each (index, field)=>
      data[field.name] = field.value
      @validate(data) if index+1 == form.length

  validate: (data)->
    _errors = []
    for key, val of data
      _errors.push({error: {field: [key, val], message: 'cannot be null'}}) if val is ''
    @addProgram(data) if _errors.length <= 0 else @showErrors(_errors)

  showErrors: (_errors)->
    console.log _errors
    @$el.prepend errors errors: _errors

  render: ()->
    data =
      form: form()
      programs: @collection.toJSON()
    @$el.html setup(data)
