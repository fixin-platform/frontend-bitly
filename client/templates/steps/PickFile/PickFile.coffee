Template.PickFile.helpers
  test: ->

Template.PickFile.onCreated

Template.PickFile.events
  "click .google-picker": ->
    cl window.google
    debugger if not window.google
    window.google.load('picker', '1', {"callback" : ->
      cl "asd"
    });