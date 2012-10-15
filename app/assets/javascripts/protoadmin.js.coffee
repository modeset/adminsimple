#= require jquery
#= require jquery_ujs
#= require jquery.pjax
#
#= require_self
#
#= require protoadmin/plugins/bootstrap
#= require protoadmin/plugins/datatable
#= require protoadmin/plugins/chosen
#= require protoadmin/plugins/flot
#= require protoadmin/plugins/gritter
#= require protoadmin/plugins/peity
#
#= require_tree ./protoadmin/layout
#= require_tree ./protoadmin/modules

jQuery -> Protoadmin.loaded()

class @Protoadmin # singleton

  @Layout: {}
  @Module: {}

  # provides the Protoadmin 'callback name', callback functionality
  # args: name, options = {}, callback = function() {}
  # options are:
  # only: 'controller#action' or ['controller#action', 'controller#action']
  # except: 'controller#action' or ['controller#action', 'controller#action']
  constructor: (args...) ->
    [name, options] = args
    options = {} unless typeof(options) == 'object'
    initializers[name] = $.extend({}, options, callback: args[args.length - 1])

  initializers = {}

  # called on dom:loaded or when pjax request has completed
  @loaded: ->
    for name, options of initializers
      options.callback() if @allowed(options)

  @allowed: (options) ->
    return true unless options.only || options.except
    if options.only
      for rule in (if typeof(options.only) == 'string' then [options.only] else options.only)
        console.debug(@currentControllerAndAction(), rule)
        return true if @currentControllerAndAction() == rule
      return false
    if options.except
      for rule in (if typeof(options.except) == 'string' then [options.except] else options.except)
        return false if @currentControllerAndAction() == rule
      return true

  @currentControllerAndAction: ->
    className = $('body').attr('class')
    return [className.match(/([\w^_]+)_controller/i)?[1] || 'unknown', className.match(/([\w^_]+)_action/i)?[1] || 'unknown'].join('#')

  # wait until the page has loaded before turning on css transitions
  setTimeout((-> $('body').addClass('animated')), 200)

  # add pjax functionality

  $(document).pjax('a', {container: '#content'}).on 'pjax:end', ->
    data = {}
    try data = JSON.parse($.pjax.state.data)
    catch e
#    $('body').attr(class: "#{data.body_class} animated")
    Protoadmin.loaded()

  # send every request as pjax so it's not wrapped in the template
  $.ajaxSetup(headers: {'X-PJAX': true})
