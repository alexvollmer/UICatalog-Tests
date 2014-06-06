class AlertViewsScreen extends Screen

  @alertViewBase = {
    name: "A Short Title Is Best",
    scrollViews: [
      {
        staticTexts: [
          {},
          { name:  "A message should be a short, complete sentence." }
        ]
      }
    ]
  }

  validate: ->
    # Validate the structure of the elements
    assertWindow({
      navigationBar: { name: "Alert Views" },
      tableViews: [
        {
          cells: [
            { name: "Simple" },
            { name: "Okay / Cancel" },
            { name: "Other" },
            { name: "Text Entry" },
            { name: "Secure Text Entry" }
          ]
        }
      ]
    })

    # Validate the appearance of the elements
    assertScreenMatchesImageNamed("alert_views")

  tableView: ->
    this.window().tableViews()[0]

  tapSimpleCell: ->
    alertAppeared = false
    UIATarget.onAlert = (alert) ->
      alertAppeared = true

      assertElementTree(alert, extend({
        defaultButton: null,
        cancelButton: { name: "OK" }
      }, @alertViewBase))
      false

    this.tableView().cells()["Simple"].tap()
    retry(() ->
      assertTrue(alertAppeared, "No alert view appeared")
    )

  tapOkayCancelCell: ->
    alertAppeared = false
    UIATarget.onAlert = (alert) ->
      alertAppeared = true
      assertElementTree(alert, extend({
        cancelButton: { name: "Cancel" },
        defaultButton: { name: "OK" }
      }, @alertViewBase))
      false

    this.tableView().cells()["Okay / Cancel"].tap()
    retry(() ->
      assertTrue(alertAppeared, "No alert view appeared")
    )

  tapOtherCell: ->
    alertAppeared = false
    UIATarget.onAlert = (alert) ->
      alertAppeared = true
      assertElementTree(alert, extend({
        buttons: [
          { name: "Choice One" },
          { name: "Choice Two" },
          { name: "Cancel" }
        ]
      }, @alertViewBase))
      false

    this.tableView().cells()["Other"].tap()
    retry(() ->
      assertTrue(alertAppeared, "No alert view appeared")
    )

  tapTextEntryCell: ->
    alertAppeared = false
    UIATarget.onAlert = (alert) ->
      alertAppeared = true
      assertElementTree(alert, extend({
        cancelButton: { name: "Cancel" },
        defaultButton: { name: "OK" },
        images: [  # yes, it's truly inside of an image
          {
            textFields: (fields) ->
              assertEquals(1, fields.length, "No text fields found")
          }
        ]
      }, @alertViewBase))
      false

    this.tableView().cells()["Text Entry"].tap()
    retry(() ->
      assertTrue(alertAppeared, "No alert view appeared")
    )

  tapSecureTextEntryCell: ->
    alertAppeared = false
    UIATarget.onAlert = (alert) ->
      alertAppeared = true
      assertElementTree(alert, extend({
        cancelButton: { name: "Cancel" },
        defaultButton: { name: "OK" },
        images: [  # yes, it's truly inside of an image
          {
            secureTextFields: (fields) ->
              assertEquals(1, fields.length, "No text fields found")
          }
        ]
      }, @alertViewBase))
      false

    this.tableView().cells()["Secure Text Entry"].tap()
    retry(() ->
      assertTrue(alertAppeared, "No alert view appeared")
    )

  tableView: ->
    this.window().tableViews()[0]
