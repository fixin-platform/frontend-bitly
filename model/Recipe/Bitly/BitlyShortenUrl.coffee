class Recipes.BitlyShortenUrl extends Recipes.Bitly
  generateSteps: ->
    position = 1

    @generateStep(
      key: "BitlyPickFile"
    ,
      $setOnInsert:
        cls: "BitlyPickFile"
        api: "Bitly"
        scopes: ["*"]
      $set:
        position: position++
    )

  input: (step) ->
    switch step.key
      when "BellefitGenerate_3DCartOrdersByFreshdeskUserIdCollection"
        steps = @stepsByKey()
        input =
          FreshdeskDownloadUsers:
            FreshdeskReadUsers:
              input:
                avatarId: steps["FreshdeskChooseAvatar"].avatarId
                params: {}
            FreshdeskSaveUsers:
              input:
                avatarId: steps["FreshdeskChooseAvatar"].avatarId
                params: {}
          _3DCartDownloadOrders:
            _3DCartReadOrders:
              input:
                avatarId: steps["_3DCartChooseAvatar"].avatarId
                params: {}
            _3DCartSaveOrders:
              input:
                avatarId: steps["_3DCartChooseAvatar"].avatarId
                params: {}
          BellefitGenerate_3DCartOrdersByFreshdeskUserIdCollection:
            Freshdesk:
              avatarId: steps["FreshdeskChooseAvatar"].avatarId
              params: {}
            _3DCart:
              avatarId: steps["_3DCartChooseAvatar"].avatarId
              params: {}
        if Foreach.isDebug
          _.extend input._3DCartDownloadOrders._3DCartReadOrders.input.params,
            datestart: "06/15/2012"
            dateend: "07/15/2012"
        else
          _.extend input._3DCartDownloadOrders._3DCartReadOrders.input.params,
            datestart: moment().subtract(3, "month").format("MM/DD/YYYY")
      else
        throw new Meteor.Error "Recipe:unknown-step-cls", "Can't generate input for unknown step cls '#{step.cls}'",
          recipe: recipe
          step: step
    input

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


