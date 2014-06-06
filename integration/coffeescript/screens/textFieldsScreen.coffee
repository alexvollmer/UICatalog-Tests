class TextFieldsScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Text Fields" },
      tableViews: [
        {
          groups: [
            { name: 'DEFAULT' },
            { name: 'TINTED' },
            { name: 'SECURE' },
            { name: 'SPECIFIC KEYBOARD' },
            { name: 'CUSTOM' },
          ],
          cells: [
            { textFields: [ { value: 'Placeholder text'} ] },
            { textFields: [ { value: 'Placeholder text'} ] },
            { secureTextFields: [ { value: 'Placeholder text'} ] },
            { textFields: [ { value: 'Placeholder text'} ] },
            { textFields: [ { value: 'Placeholder text'} ] }
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("text_fields")

