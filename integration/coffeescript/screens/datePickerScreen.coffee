class DatePickerScreen extends Screen

  validate: ->
    this.logElementTree()

    now = new Date()

    # Validate the structure of the screen
    assertWindow({
      navigationBar: { name: "Date Picker" },
      pickers: [
        {
          wheels: [
            { value: "Today" },
            {
              value: (value) ->
                expectedHour = String(now.getHours())
                if now.getHours() < 10
                  expectedHour = "0" + expectedHour

                assertEquals(expectedHour, value, "Mismatched picker wheel for hours")
            },
            {
              value: (value) ->
                expectedMinutes = String(now.getMinutes())
                if now.getMinutes() < 10
                  expectedMinutes = "0" + expectedMinutes

                assertEquals(expectedMinutes, value, "Mismatched picker wheel for minutes")
            }
          ]
        }
      ],
      staticTexts: (staticTexts) ->
        assertEquals(1, staticTexts.length, "There should be one static text")
        staticText = staticTexts[0]

        components = staticText.value().split(' ')
        pickerDay = Number(components[0])
        pickerMonth = components[1]
        pickerYear = Number(components[2])
        pickerTime = components[3].split(':')
        pickerHours = Number(pickerTime[0])
        pickerMinutes = Number(pickerTime[1])

        assertEquals(now.getFullYear(), pickerYear, "Year mismatch")

        months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        assertEquals(months[now.getMonth()], pickerMonth, "Month mismatch")

        assertEquals(now.getDate(), pickerDay, "Day mismatch")
        assertEquals(now.getHours(), pickerHours, "Hours mismatch")
        assertEquals(now.getMinutes(), pickerMinutes, "Minutes mismatch")
    })

    # Validate visual appearance of the screen
    # TODO: Appearance of date picker is dependent on the current
    # time which will vary between runs
    # assertScreenMatchesImageNamed("date_picker")

  picker: ->
    this.window().pickers()[0]

  dayWheel: ->
    this.picker().wheels()[0]

  hourWheel: ->
    this.picker().wheels()[1]

  minuteWheel: ->
    this.picker().wheels()[2]

  staticText: ->
    this.window().staticTexts()[0]

  assertDayPickerChangesLabel: ->
    # Picker wheel dragging seems broken at the moment
    return

    UIALogger.logDebug("dayWheel.values(): " + this.dayWheel().values())
    this.dayWheel().dragInsideWithOptions({
      startOffset:{x:0.5, y:0.61},
      endOffset:{x:0.5, y:0.28},
      duration:0.3
    });

    labelValues = this.staticText().value().split(' ')
    UIALogger.logDebug("labelValues: " + labelValues)

    dayWheelValue = this.dayWheel().value().split(' ')
    UIALogger.logDebug("dayWheelValue: " + dayWheelValue)
    date = dayWheelValue[1]
    if date.length < 2
      date = "0" + date

    assertEquals(date, labelValues[0], "Day of month not updated")
    assertEquals(dayWheelValue[2], labelValues[1], "Month not updated")

  assertHourPickerChangesLabel: ->
    # TODO

  assertMinutePickerChangesLabel: ->
    # TODO
