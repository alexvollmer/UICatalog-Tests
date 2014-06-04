class MainScreen extends Screen

  validate: ->
    # Programatically assert the structure of the screen
    assertWindow({
      navigationBar: { name: "UICatalog" },
      tableViews: [
        {
          cells: [
            { name: /^Action Sheets/ },
            { name: /^Activity Indicators/ },
            { name: /^Alert Views/ },
            { name: /^Buttons/ },
            { name: /^Date Picker/ },
            { name: /^Image View/ },
            { name: /^Page Control/ },
            { name: /^Picker View/ },
            { name: /^Progress Views/ },
            { name: /^Segmented Controls/ },
            { name: /^Sliders/ },
            { name: /^Steppers/ },
            { name: /^Switches/ },
            { name: /^Text Fields/ },
            { name: /^Text View/ },
            { name: /^Web View/ },
            { name: "Search Bars" },
            { name: "Toolbars" }
          ]
        }
      ]
    })

    # Visually assert that the screen looks right
    createImageAsserter("tuneup_js", "integration/tmp/results", "integration/screenshots")
    assertScreenMatchesImageNamed("main_screen", "Nope, that doesn't look right")

  tableView: ->
    this.window().tableViews()[0]

  tapActionSheetsCell: ->
    this.tableView().cells()[0].tap()
    this.delay(2)

  tapActivityIndicatorsCell: ->
    this.tableView().cells()[1].tap()
    this.delay(2)

  tapAlertViewsCell: ->
    this.tableView().cells()[2].tap()
    this.delay(2)