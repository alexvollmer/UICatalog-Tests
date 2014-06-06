class PageControlScreen extends Screen

  validate: ->
    this.logElementTree()
    assertWindow({
      navigationBar: { name: "Page Control" }
    })

    assertScreenMatchesImageNamed("page_control")

