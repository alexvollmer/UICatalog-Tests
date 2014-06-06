class SwitchesScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Switches" },
      tableViews: [
        {
          groups: [
            { name: 'DEFAULT' },
            { name: 'TINTED' }
          ],
          cells: [
            {
              switches: [ { value: 1 }]
            },
            {
              switches: [ { value: 1 }]
            }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("switches")
