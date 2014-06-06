class ProgressViewsScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Progress Views" },
      tableViews: [
        {
          groups: [
            { name: 'DEFAULT' },
            { name: 'BAR' },
            { name: 'TINTED' }
          ],
          cells: [
            {
              name: 'Progress',
              progressIndicators: [ {} ]  # one progress indicator exists
            },
            {
              name: 'Progress',
              progressIndicators: [ {} ]  # one progress indicator exists
            },
            {
              name: 'Progress',
              progressIndicators: [ {} ]  # one progress indicator exists
            }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    # TODO: the progress views automatically update making a single
    # image comparison brittle since the UI is likely to be different
    # from our captured screenshot
    # assertScreenMatchesImageNamed("progress_views")
