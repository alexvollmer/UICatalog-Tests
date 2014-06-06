#import "../../../../tuneup_js/tuneup.js"
#import "../screens.js"

mainScreen = new MainScreen()

# Setup image-assertion mechanism
createImageAsserter("tuneup_js", "integration/tmp/results", "integration/screenshots")

test "The main screen", (target, app) ->
  mainScreen.validate()

test "Action Sheets", (target, app) ->
  mainScreen.tapActionSheetsCell()

  actionSheetsScreen = new ActionSheetsScreen()
  actionSheetsScreen.validate()

  actionSheetsScreen.tapOkayCancel()
  actionSheetsScreen.tapOther()
  actionSheetsScreen.goBack()

test "Activity Indicators", (target, app) ->
  mainScreen.tapActivityIndicatorsCell()

  spinnersScreen = new ActivityIndicatorsScreen()
  spinnersScreen.validate()
  spinnersScreen.goBack()

test "Alert View", (target, app) ->
  mainScreen.tapAlertViewsCell()

  alertViewsScreen = new AlertViewsScreen()
  alertViewsScreen.validate()

  alertViewsScreen.tapSimpleCell()
  alertViewsScreen.tapOkayCancelCell()
  alertViewsScreen.tapOtherCell()
  alertViewsScreen.tapTextEntryCell()
  alertViewsScreen.tapSecureTextEntryCell()
  alertViewsScreen.goBack()

test "Buttons", (target, app) ->
  mainScreen.tapButtonsCell()

  buttonsScreen = new ButtonsScreen()
  buttonsScreen.validate()
  buttonsScreen.goBack()

test "Date Picker", (target, app) ->
  mainScreen.tapDatePickerCell()

  datePickerScreen = new DatePickerScreen()
  datePickerScreen.validate()

  datePickerScreen.assertDayPickerChangesLabel()
  datePickerScreen.assertHourPickerChangesLabel()
  datePickerScreen.assertMinutePickerChangesLabel()
  datePickerScreen.goBack()

test "Image View", (target, app) ->
  mainScreen.tapImageViewCell()

  imageViewScreen = new ImageViewScreen()
  imageViewScreen.validate()
  imageViewScreen.goBack()

test "Page Control", (target, app) ->
  mainScreen.tapPageControlCell()

  pageControlScreen = new PageControlScreen()
  pageControlScreen.validate()
  pageControlScreen.goBack()


test "Picker View", (target, app) ->
  mainScreen.tapPickerViewCell()

  pickerViewScreen = new PickerViewScreen()
  pickerViewScreen.validate()
  pickerViewScreen.goBack()

test "Progress Views", (target, app) ->
  mainScreen.tapProgressViewsCell()

  progressViewsScreen = new ProgressViewsScreen()
  progressViewsScreen.validate()
  progressViewsScreen.goBack()

test "Segmented Controls", (target, app) ->
  mainScreen.tapSegmentedControlsCell()

  segmentedControlsScreen = new SegmentedControlsScreen()
  segmentedControlsScreen.validate()
  segmentedControlsScreen.goBack()

test "Sliders", (target, app) ->
  mainScreen.tapSlidersCell()

  slidersScreen = new SlidersScreen()
  slidersScreen.validate();
  slidersScreen.goBack()

test "Switches", (target, app) ->
  mainScreen.tapSwitchesCell()

  switchesScreen = new SwitchesScreen()
  switchesScreen.validate()
  switchesScreen.goBack()

test "Text Fields", (target, app) ->
  mainScreen.tapTextFieldsCell()

  textFieldsScreen = new TextFieldsScreen()
  textFieldsScreen.validate()
  textFieldsScreen.goBack()

test "Text Area", (target, app) ->
  mainScreen.tapTextViewCell()

  textViewScreen = new TextViewScreen()
  textViewScreen.validate()
  textViewScreen.goBack()

test "Web View", (target, app) ->
  mainScreen.tapWebViewCell()

  webViewScreen = new WebViewScreen()
  webViewScreen.validate()
  webViewScreen.goBack()

test "Search Bars", (target, app) ->
  mainScreen.tapSearchBarsCell()

  searchBarsScreen = new SearchBarsScreen()
  searchBarsScreen.validate()

  # Calling 'searchBarsScreen.goBack()' seems to fail because of a lost
  # reference to the left navigation bar. Perhaps a side-effect of
  # navigating in another level?
  target.delay(1)
  app.mainWindow().navigationBar().leftButton().tap()

test "Toolbars", (target, app) ->
  mainScreen.tapToolbarsCell()

  toolbarsScreen = new ToolbarsScreen()
  toolbarsScreen.validate()

  # Calling 'toolbarsScreen.goBack()' seems to fail because of a lost
  # reference to the left navigation bar. Perhaps a side-effect of
  # navigating in another level?
  target.frontMostApp().mainWindow().navigationBar().leftButton()
