# What Is This?
Something tuneup_js has lacked from the beginning is both a test suite
to find regressions and a good example to demonstrate what you can do
with it.

This project is a suite of UIAutomation tests for the 
[UICatalog](https://developer.apple.com/library/ios/samplecode/UICatalog/Introduction/Intro.html) 
sample project.

# Running The Tests
These tests were written in [CoffeeScript](http://coffeescript.org) and are
packaged to run using [Bwoken](https://github.com/bendyworks/bwoken).

Bwoken requires a specific directory structure to work correctly. First
Bwoken assumes that the working directory contains a proper Xcode project
and that all UIAutomation tests are in a directory named `integration` .

The easiest way to run this, make a symbolic link from the "UICatalog"
project to the `integration` directory in this project's directory.

# Design
There is a single main test file in `integration/coffeescript/iphone/main.coffee`.
The test executes a linear series of `test` invocations that progressively
walk through the main table-view of the `UICatalog` app.

Each test uses a series of "screen" objects which encapsulate the exercising
and validation of each screen. These are found in 
`integration/coffeescript/screens` and all extend a parent `Screen` class
found in `integration/coffeescript/screen.coffee`. By importing the
`integration/coffeescript/screens.coffee` file, all of the other screen 
classes are also imported.

## Image Assertion
As much as possible, the tests make use of tuneup's image assertion feature.
In some cases there are small differences between a captured screen and
the reference screen (usually due to dynamic data). The reference images are
still included in the tests and there are commented-out calls to the image
asserter just to show where they would occur.

At some point we hope to add some kind of image-masking feature to make the
image assertion mechanism work better in the face of dynamic data.
