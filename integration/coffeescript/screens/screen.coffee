class Screen

  window: ->
    UIATarget.localTarget().frontMostApp().mainWindow()

  navigationBar: ->
    this.window().navigationBar()

  logElementTree: ->
    this.window().logElementTree()

  delay: (time) ->
    UIATarget.localTarget().delay(time)
