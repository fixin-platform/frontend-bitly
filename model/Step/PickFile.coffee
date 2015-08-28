class Steps.PickFile extends Steps.Step
  template: "PickFile"

  setSpreadsheet: (data) ->
    Steps.update({_id: @_id}, {$set: {spreadsheet: data}})
