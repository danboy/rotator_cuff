#= require radiator
#= require_tree templates
#= require_tree lib
#= require_tree .

window.radiator = new Radiator.Router el: '#canvas'
Backbone.history.start pushState: true 

if Backbone.history and Backbone.history._hasPushState
  $(document).delegate "a", "click", (evt) ->
    href = $(this).attr("href")
    protocol = @protocol + "//"
    if href.slice(protocol.length) isnt protocol
      evt.preventDefault()
      Backbone.history.navigate href, true
