#import "../../../../tuneup_js/tuneup.js"
#import "../screens.js"

# Setup image-assertion mechanism
createImageAsserter("tuneup_js", "integration/tmp/results", "integration/screenshots")

test "The main screen", (target, app) ->
  mainScreen = new MainScreen()
  mainScreen.validate()

test "Action Sheets", (target, app) ->
  mainScreen = new MainScreen()
  mainScreen.tapActionSheetsCell()

  actionSheetsScreen = new ActionSheetsScreen()
  actionSheetsScreen.validate()

  actionSheetsScreen.tapOkayCancel()
  actionSheetsScreen.tapOther()
  actionSheetsScreen.goBack()

test "Activity Indicators", (target, app) ->
  mainScreen = new MainScreen()
  mainScreen.tapActivityIndicatorsCell()

  spinnersScreen = new ActivityIndicatorsScreen()
  spinnersScreen.validate()

  spinnersScreen.goBack()

test "Alert View", (target, app) ->
  mainScreen = new MainScreen()
  mainScreen.tapAlertViewsCell()

  alertViewsScreen = new AlertViewsScreen()
  alertViewsScreen.validate()

  alertViewsScreen.tapSimpleCell()
  alertViewsScreen.tapOkayCancelCell()
  alertViewsScreen.tapOtherCell()
  alertViewsScreen.tapTextEntryCell()
  alertViewsScreen.tapSecureTextEntryCell()

  alertViewsScreen.goBack()
