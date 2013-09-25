#= require radiator
#= require_tree templates
#= require_tree lib
#= require_tree .

radiator = new Radiator.Router({el: '#canvas'})
Backbone.history.start({pushState: true})
