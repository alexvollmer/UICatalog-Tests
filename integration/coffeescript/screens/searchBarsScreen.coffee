class SearchBarsScreen extends Screen

  tableView: ->
    this.window().tableViews()[0]

  tapDefaultCell: ->
    this.tableView().cells().firstWithPredicate("name BEGINSWITH 'Default'").tap()

  tapCustomCell: ->
    this.tableView().cells().firstWithPredicate("name BEGINSWITH 'Custom'").tap()

  validate: ->
    assertWindow({
      navigationBar: { name: "Search Bars" },
      tableViews: [
        {
          cells: [
            { name: /^Default/ },
            { name: /^Custom/ }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("search_bars")

    this.tapDefaultCell()
    this.delay(1)
    defaultScreen = new DefaultSearchBarScreen()
    defaultScreen.validate()
    defaultScreen.goBack()

    this.tapCustomCell()
    this.delay(1)
    custom = new CustomSearchBarScreen()
    custom.validate()
    custom.goBack()

class DefaultSearchBarScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Default Search Bar" },
      searchBars: [ {} ],
      buttons: [
        { name: 'Cancel' }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("default_search_bar")

class CustomSearchBarScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Custom Search Bar" },
      searchBars: [ {} ],
      buttons: [
        { name: 'Cancel' }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("custom_search_bar")
