class ActivityIndicatorsScreen extends Screen

  validate: ->
    # Validate the structure of the Screen
    assertWindow({
      navigationBar: { name: "Activity Indicators" },
      tableViews: [
        {
          groups: [
            { name: "GRAY" },
            { name: "TINTED" }
          ],
          cells: [
            {
              activityIndicators: (spinners) ->
                assertEquals(1, spinners.length)
            },
            {
              activityIndicators: (spinners) ->
                assertEquals(1, spinners.length)
            }
          ]
        }
      ]
    })

    # Validate the appearance
    # NOTE: disabled for now since the images may differ based on
    # what cycle the activity indicators are in during their spin

    # assertScreenMatchesImageNamed("activity_indicators")

  tableView: ->
    this.window().tableViews()[0]

  goBack: ->
    this.navigationBar().leftButton().tap()