class TextViewScreen extends Screen

  validate: ->
    assertWindow({
      navigationBar: { name: "Text View" },
      textViews: [
        {
          value: /^This is a UITextView that uses attributed text/
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("text_view")
