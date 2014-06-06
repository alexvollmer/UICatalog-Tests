class PickerViewScreen extends Screen

  validate: ->
    this.logElementTree()

    assertWindow({
      navigationBar: { name: "Picker View" },
      pickers: [
        {
          wheels: [
            # The button values have other values tacked on to the returned
            # value that aren't visible
            { value: /^65/ }, { value: /^205/ }, { value: /^120/ }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("picker_view")
