class PageControlScreen extends Screen

  validate: ->
    this.logElementTree()
    assertWindow({
      navigationBar: { name: "Page Control" },
      pageControls: [ {} ]
    })

    assertScreenMatchesImageNamed("page_control")

