class Radiator.Views.Setup extends Backbone.View
  events:
    'click button[type=submit]': 'submitForm'
  
  initialize: (options)->
    @collection.fetch
      success: (co, res, op)=>
        console.log 'success', co, res, op
        @render()
      error: (e)=>
        console.log 'error'
  
  addProgram: (data)->
    @collection.create data
    @render()
  
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
