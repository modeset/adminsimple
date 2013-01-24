class Protoadmin.Layout.Theme

  constructor: ->
    @initialize()
    @addListeners()


  initialize: ->
    @document = $(document)
    @body = $('body')
    @has_storage = typeof Storage != undefined
    @set(localStorage.theme) if @has_storage and localStorage.theme
    @changed()


# PUBLIC #

  get: ->
    return localStorage.theme if @has_storage and localStorage.theme
    @body.attr('id').replace /protoadmin_/g, ''


  set: (theme) ->
    @body.attr 'id', "protoadmin_#{theme}"
    localStorage.theme = theme if @has_storage


  reset: ->
    localStorage.removeItem(theme) if @has_storage and localStorage.theme


  dispose: ->
    @removeListeners()


# PROTECTED #

  userInitiatedSetTheme: (e) ->
    @set $(e.target).val()


  changed: (e) ->
    @setChecked() if (/settings/g).test Protoadmin.currentControllerAndAction()


  setChecked: ->
    inputs = $('#theme_controls input')
    theme = @get()
    selected = null
    for input in inputs
      $input = $(input)
      selected = $input if $input.val() is theme
    selected.attr('checked', true) if selected


  addListeners: ->
    @document.on 'click', '#theme_controls input:radio', => @userInitiatedSetTheme arguments...
    @document.on 'pjax:end.proto_theme', => @changed arguments...


  removeListeners: ->
    @document.off 'click', '#theme_controls input:radio'
    @document.off 'pjax:end.proto_theme'


jQuery -> new Protoadmin.Layout.Theme()

