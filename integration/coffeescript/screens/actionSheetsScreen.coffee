class ActionSheetsScreen extends Screen

  validate: ->
    # Validate the structure of the screen
    assertWindow({
      navigationBar: { name: "Action Sheets" },
      tableViews: [
        {
          cells:[
            { name: "Okay / Cancel" },
            { name: "Other" }
          ]
        }
      ]
    })

    # Visually assert that the screen looks right
    createImageAsserter("tuneup_js", "integration/tmp/results", "integration/screenshots")
    assertScreenMatchesImageNamed("action_sheets", "Nope, that doesn't look right")

  tableView: ->
    this.window().tableViews()[0]

  tapOkayCancel: ->
    this.tableView().cells()[0].tap()
    retry(() ->
      assertNotNull(UIATarget.localTarget().frontMostApp().actionSheet())
    )

    actionSheet = UIATarget.localTarget().frontMostApp().actionSheet()
    assertEquals("Cancel", actionSheet.cancelButton().name())

    okButton = actionSheet.buttons()[0]
    assertNotNull(okButton, "No 'OK' button found")
    assertEquals("OK", okButton.name())
    okButton.tap()

  tapOther: ->
    this.tableView().cells()[1].tap()
    this.logElementTree()
    retry(() ->
      assertNotNull(UIATarget.localTarget().frontMostApp().actionSheet())
    )

    actionSheet = UIATarget.localTarget().frontMostApp().actionSheet()
    destructiveChoice = actionSheet.buttons()[0]
    assertNotNull(destructiveChoice, "No 'Destructive Choice' button found")
    assertEquals("Destructive Choice", destructiveChoice.name())

    safeChoice = actionSheet.buttons()[1]
    assertNotNull(safeChoice, "No 'Safe Choice' button found")
    assertEquals("Safe Choice", safeChoice.name())
    safeChoice.tap()

  goBack: ->
    this.navigationBar().leftButton().tap()