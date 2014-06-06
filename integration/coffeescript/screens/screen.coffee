class Screen

  window: ->
    UIATarget.localTarget().frontMostApp().mainWindow()

  navigationBar: ->
    this.window().navigationBar()

  goBack: ->
    this.navigationBar().leftButton().tap()

  logElementTree: ->
    this.window().logElementTree()

  delay: (time) ->
    UIATarget.localTarget().delay(time)
