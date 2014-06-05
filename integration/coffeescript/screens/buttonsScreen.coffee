class ButtonsScreen extends Screen

  validate: ->
    this.logElementTree()
    assertWindow({
      navigationBar: { name: "Buttons" },
      tableViews: [
        {
          groups: [
            { name: "SYSTEM (TEXT)" },
            { name: "SYSTEM (CONTACT ADD)" },
            { name: "SYSTEM (DETAIL DISCLOSURE)" },
            { name: "IMAGE" },
            { name: "ATTRIBUTED TEXT" }
          ],
          cells: [
            { name: "Button", buttons: [ {} ] },
            { buttons: [ {} ]},
            { buttons: [ {} ]},
            { name: "X Button", buttons: [ {} ]},
            { name: "Button", buttons: [ {} ]}
          ]
        }
      ]
    })

    # Now validate the visual appearance
    assertScreenMatchesImageNamed("alert_views")
