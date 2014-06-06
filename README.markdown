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
