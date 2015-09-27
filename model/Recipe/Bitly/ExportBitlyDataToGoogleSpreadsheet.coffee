class Recipes.ExportBitlyDataToGoogleSpreadsheet extends Recipes.Bitly
  generateSteps: ->
    @insertStep
      key: "BitlyChooseAvatar"
      cls: "BitlyChooseAvatar"
      api: "Bitly"
      scopes: ["*"]
    @insertStep
      key: "GoogleChooseAvatar"
      cls: "GoogleChooseAvatar"
      api: "Google"
      scopes: ["https://www.googleapis.com/auth/drive", "https://spreadsheets.google.com/feeds"]
    @insertStep
      key: "ExportBitlyDataToGoogleSpreadsheet"
      cls: "ExportBitlyDataToGoogleSpreadsheet"

  input: (step) ->
    switch step.key
      when "ExportBitlyDataToGoogleSpreadsheet"
        steps = @stepsByKey()
        username = Avatars.findOne(steps["BitlyChooseAvatar"].avatarId).name
        input = if step.spreadsheet
          DownloadBitlyLinks:
            ReadBitlyLinks:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            ReadBitlyClicks:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            ReadBitlyReferrers:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            SaveBitlyLinks:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            SaveBitlyReferrers:
              avatarId: steps["BitlyChooseAvatar"].avatarId
          ExportBitlyDataToGoogleSpreadsheet:
            GoogleWriter:
              avatarId: steps["GoogleChooseAvatar"].avatarId
              spreadsheet: step.spreadsheet
            LinkLoader:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            ReferrerLoader:
              avatarId: steps["BitlyChooseAvatar"].avatarId
        else
          CreateGoogleSpreadsheet:
            FileLoader:
              file: "asset/clean.xlsx"
            SpreadsheetWriter:
              avatarId: steps["GoogleChooseAvatar"].avatarId
              meta:
                title: "Bitly Links (#{username})"
          DownloadBitlyLinks:
            ReadBitlyLinks:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            ReadBitlyClicks:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            ReadBitlyReferrers:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            SaveBitlyLinks:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            SaveBitlyReferrers:
              avatarId: steps["BitlyChooseAvatar"].avatarId
          ExportBitlyDataToGoogleSpreadsheet:
            GoogleWriter:
              avatarId: steps["GoogleChooseAvatar"].avatarId
            LinkLoader:
              avatarId: steps["BitlyChooseAvatar"].avatarId
            ReferrerLoader:
              avatarId: steps["BitlyChooseAvatar"].avatarId
      else
        throw new Meteor.Error "Recipe:unknown-step-cls", "Can't generate input for unknown step cls '#{step.cls}'",
          recipe: @
          step: step
    input

  progressBars: (step) ->
    switch step.key
      when "ExportBitlyDataToGoogleSpreadsheet"
        skippedActivityIds = []
        skippedActivityIds.push "CreateGoogleSpreadsheet" if step.spreadsheet
        progressBars = @generateProgressBars [
          "CreateGoogleSpreadsheet"
          "DownloadBitlyLinks"
          "ExportBitlyDataToGoogleSpreadsheet"
        ], [
          "CreateGoogleSpreadsheet"
          "DownloadBitlyLinks"
        ], skippedActivityIds
      else
        throw new Meteor.Error "Recipe:unknown-step-cls", "Can't generate progress bars for unknown step cls '#{step.cls}'",
          recipe: @
          step: step
    progressBars
