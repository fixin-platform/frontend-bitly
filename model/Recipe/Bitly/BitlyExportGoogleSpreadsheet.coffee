class Recipes.BitlyExportGoogleSpreadsheet extends Recipes.Bitly
  generateSteps: ->
    position = 1

    @generateStep(
      key: "BitlyChooseAvatar"
    ,
      $setOnInsert:
        cls: "BitlyChooseAvatar"
        api: "Bitly"
        scopes: ["*"]
      $set:
        position: position++
    )
    @generateStep(
      key: "GoogleChooseAvatar"
    ,
      $setOnInsert:
        cls: "GoogleChooseAvatar"
        api: "Google"
        scopes: ["https://www.googleapis.com/auth/drive", "https://spreadsheets.google.com/feeds"]
      $set:
        position: position++
    )
    @generateStep(
      key: "BitlyExportGoogleSpreadsheet"
    ,
      $setOnInsert:
        cls: "BitlyExportGoogleSpreadsheet"
      $set:
        position: position++
    )

  input: (step) ->
    switch step.key
      when "BitlyExportGoogleSpreadsheet"
        steps = @stepsByKey()
        input = if step.spreadsheet
          BitlyDownloadLinks:
            avatarId: steps["BitlyChooseAvatar"].avatarId
            params: {}
          BitlyExportGoogleSpreadsheet:
            avatarId: steps["GoogleChooseAvatar"].avatarId
            params:
              spreadsheet: step.spreadsheet
        else
          CreateGoogleSpreadsheet:
            FileLoader:
              file: "asset/BitlyLinks.xlsx"
            SpreadsheetWriter:
              avatarId: steps["GoogleChooseAvatar"].avatarId
              meta:
                title: "Bitly Links (@username)"
          BitlyDownloadLinks:
            avatarId: steps["BitlyChooseAvatar"].avatarId
            params: {}
          BitlyExportGoogleSpreadsheet:
            avatarId: steps["GoogleChooseAvatar"].avatarId
            params: {}
      else
        throw new Meteor.Error "Recipe:unknown-step-cls", "Can't generate input for unknown step cls '#{step.cls}'",
          recipe: @
          step: step
    input

  progressBars: (step) ->
    switch step.key
      when "BitlyExportGoogleSpreadsheet"
        skippedActivityIds = []
        skippedActivityIds.push "GoogleWriteSpreadsheets" if step.spreadsheet
        progressBars = @generateProgressBars [
          "GoogleWriteSpreadsheets"
          "BitlyDownloadLinks"
          "GoogleWriteSpreadsheetCells"
        ], [
          "GoogleWriteSpreadsheets"
          "BitlyDownloadLinks"
        ], skippedActivityIds
      else
        throw new Meteor.Error "Recipe:unknown-step-cls", "Can't generate progress bars for unknown step cls '#{step.cls}'",
          recipe: @
          step: step
    progressBars
