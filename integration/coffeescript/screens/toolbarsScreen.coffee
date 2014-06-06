class ToolbarsScreen extends Screen

  validate: ->
    this.logElementTree()

    assertWindow({
      navigationBar: { name: "Toolbars" },
      tableViews: [
        {
          cells: [
            { name: /^Default/ },
            { name: /^Tinted/ },
            { name: /^Custom/ }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("toolbars")

    this.tapDefaultCell()
    defaultScreen = new DefaultToolbarsScreen()
    defaultScreen.validate()
    defaultScreen.goBack()

    this.tapTintedCell()
    tintedScreen = new TintedToolbarsScreen()
    tintedScreen.validate()
    tintedScreen.goBack()

    this.tapCustomCell()
    customScreen = new CustomToolbarsScreen()
    customScreen.validate()
    customScreen.goBack()

  tableView: ->
    this.window().tableViews()[0]

  tapDefaultCell: ->
    this.tableView().cells().firstWithPredicate("name BEGINSWITH 'Default'").tap()
    this.delay(1)

  tapTintedCell: ->
    this.tableView().cells().firstWithPredicate("name BEGINSWITH 'Tinted'").tap()
    this.delay(1)

  tapCustomCell: ->
    this.tableView().cells().firstWithPredicate("name BEGINSWITH 'Custom'").tap()
    this.delay(1)

class DefaultToolbarsScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Default Toolbar" },
      toolbars: [
        {
          buttons: [
            { name: 'Delete' },
            { name: 'Action' }
          ]
        },
        {} # There's another toolbar we don't really care about
      ]
    })

    assertScreenMatchesImageNamed("default_toolbar")

class TintedToolbarsScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Tinted Toolbar" },
      toolbars: [
        {
          buttons: [
            { name: 'Refresh' },
            { name: 'Share' }
          ]
        },
        {} # There's another toolbar we don't care about
      ]
    })

    assertScreenMatchesImageNamed("tinted_toolbar")

class CustomToolbarsScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Custom Toolbar" },
      toolbars: [
        {
          buttons: [
            { name: 'tools icon' },
            { name: 'Button' }
          ]
        },
        {} # there's another toolbar we don't care about
      ]
    })

    assertScreenMatchesImageNamed("custom_toolbar")
