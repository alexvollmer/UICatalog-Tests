class SegmentedControlsScreen extends Screen

  validate: ->
    # Though this screen is all about display UISegmentControl, the
    # segment controls in this screen are not found via the
    # `segmentedControls` of the cell. Instead, the individual buttons
    # of each segment control are found in each cell's `buttons` property.
    # Go figure.

    expectedButtons = [
      { name: 'Check' }, { name: 'Search' }, { name: 'Tools' }
    ]

    assertWindow({
      navigationBar: { name: "Segmented Controls" },
      tableViews: [
        {
          groups: [
            { name: 'DEFAULT' },
            { name: 'TINTED' },
            { name: 'CUSTOM SEGMENTS' },
            { name: 'CUSTOM BACKGROUND' },
          ],
          cells: [
            {
              buttons: expectedButtons
            },
            {
              buttons: expectedButtons
            },
            {
              buttons: [
                { name: 'Done' }, { name: 'Search' }, { name: 'Settings' }
              ]
            },
            {
              buttons: expectedButtons
            }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("segmented_controls")
