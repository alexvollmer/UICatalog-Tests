class SlidersScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Sliders" },
      tableViews: [
        groups: [
          { name: 'DEFAULT' },
          { name: 'TINTED' },
          { name: 'CUSTOM' },
        ],
        cells: [
          {
            sliders: [
              { value: '42%' }
            ]
          },
          {
            sliders: [
              { value: '50%' }
            ]
          },
          {
            sliders: [
              { value: '84%' }
            ]
          }
        ]
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("sliders")
