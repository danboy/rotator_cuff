class Radiator.Program extends Backbone.Model

class Radiator.Programs extends Backbone.Collection
  localStorage: new Backbone.LocalStorage "Radiator.Programs"
  model:        Radiator.Program
  comparator:   (program)->
    program.get('order')
