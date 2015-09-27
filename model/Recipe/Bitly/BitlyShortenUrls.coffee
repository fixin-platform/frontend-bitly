class Recipes.BitlyShortenUrls extends Recipes.Bitly
  generateSteps: ->
    throw new Error("generateSteps() format changed, see ExportBitlyDataToGoogleSpreadsheet")

    position = 1

    @generateStep(
      key: "PickFile"
    ,
      $setOnInsert:
        cls: "PickFile"
        api: "Bitly"
        scopes: ["*"]
      $set:
        position: position++
    )

  input: (step) ->
    # TODO stub
    []

  progressBars: (step) ->
    switch step.key
      when "BellefitGenerate_3DCartOrdersByFreshdeskUserIdCollection"
        progressBars = @generateProgressBars [
          "FreshdeskDownloadUsers"
          "_3DCartDownloadOrders"
          "BellefitGenerate_3DCartOrdersByFreshdeskUserIdCollection"
        ], [
          "FreshdeskDownloadUsers"
          "_3DCartDownloadOrders"
        ]
      else
        throw new Meteor.Error "Recipe:unknown-step-cls", "Can't generate progress bars for unknown step cls '#{step.cls}'",
          recipe: recipe
          step: step
    progressBars


