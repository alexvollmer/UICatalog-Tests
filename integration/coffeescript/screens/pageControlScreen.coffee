class PageControlScreen extends Screen

  validate: ->
    this.logElementTree()
    assertWindow({
      navigationBar: { name: "Page Control" },
      pageIndicators: [ {} ]
    })

    assertScreenMatchesImageNamed("page_control")

