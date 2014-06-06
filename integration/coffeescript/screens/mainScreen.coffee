class MainScreen extends Screen

  validate: ->
    this.delay(3)  # wait for the scroll indicator to fade

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
    assertScreenMatchesImageNamed("main_screen", "Nope, that doesn't look right")

  tableView: ->
    this.window().tableViews()[0]

  tapCellWithName: (name) ->
    cell = this.tableView().cells().firstWithPredicate("name beginswith '" + name + "'")
    cell.tap()
    this.delay(2)

  tapActionSheetsCell: ->
    this.tapCellWithName("Action Sheets")

  tapActivityIndicatorsCell: ->
    this.tapCellWithName("Activity Indicators")

  tapAlertViewsCell: ->
    this.tapCellWithName("Alert Views")

  tapButtonsCell: ->
    this.tapCellWithName("Buttons")

  tapDatePickerCell: ->
    this.tapCellWithName("Date Picker")

  tapImageViewCell: ->
    this.tapCellWithName("Image View")

  tapPageControlCell: ->
    this.tapCellWithName("Page Control")

  tapPickerViewCell: ->
    this.tapCellWithName("Picker View")

  tapProgressViewsCell: ->
    this.tapCellWithName("Progress Views")

  tapSegmentedControlsCell: ->
    this.tapCellWithName("Segmented Controls")

  tapSlidersCell: ->
    this.tapCellWithName("Sliders")

  tapSwitchesCell: ->
    this.tapCellWithName("Switches")

  tapTextFieldsCell: ->
    this.tapCellWithName("Text Fields")

  tapTextViewCell: ->
    this.tapCellWithName("Text View")

  tapWebViewCell: ->
    this.tapCellWithName("Web View")

  tapSearchBarsCell: ->
    this.tapCellWithName("Search Bars")

  tapToolbarsCell: ->
    this.tapCellWithName("Toolbars")
