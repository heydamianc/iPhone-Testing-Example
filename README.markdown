# Unit Tests in Xcode

**Note:** This information is roughly accurate as of 2011-10-07.

---

When you create a new project and indicate that you would like to include unit tests, Xcode will
add an additional target.  This target will run whenever you hold on the play button for a while,
then select `Test` from the dropdown menu.  This is useful for development, however is limited in 
its scope because you can not build this target and run it from he command line. When you try to,
everything will build correctly, however it behaves as if it doesn't hit the final run script 
phase of the target (this is the script that runs the unit tests).  The primary point of confusion 
is in the way that SenTestingKit separates application and logic tests.  

**Application tests** are tests that run from within an executing application -- akin to functional 
tests or integration tests.  **Logic tests** are unit tests that test each component in isolation.

## Project Setup

Initial projects are set up to run Application tests.  In order to add Logic tests so that they can
be run on a continuous integration server, you must add another target and a scheme to run it. You
can do this by:

* Selecting the root-level icon (blueprint) in the Project navigator
* Clicking the `Add Target` button under the `Targets` section
* Selecting the `Cocoa Touch Unit Testing Bundle` from the `Other` category under the `iOS` section
* Clicking `Next`
* Entering a product name and clicking `Finish`

Once the target is created, you must adjust the following build setting:

* Remove any values for `Test Host` under the `Unit Testing` section

If you have included OCMock, you must also modify the following build settings:

* Set `Header Search Paths` to `Libraries/OCMock`
* Set `Other Linker Flags` to `-ObjC -force_load ${BUILT_PRODUCTS_DIR}/libOCMock.a`

Note that this assumes that you have 

After adding the target, you must now add a scheme that will run it:

* Under the schemes dropdown (by the stop button), select `New Scheme…`
* If your project is named `Car Lot`, name the scheme `Car Lot tests` (spaces are ok)
* Edit the new scheme
* Select the `Build` category under the `Build` section
* Ensure the `Run` checkbox is checked, or check it if it is not already

Now that you have a valid target and scheme, you must add your test classes to the new target. 
Show the right-hand drawer with the rightmost `View` icon (on the top right of Xcode).  Find all
test cases and their dependencies in the Project navigator and select them.  Once selected, the 
right-hand drawer will show which targets they are members of.  You will need to make sure that 
each test class is a member of the `Car Lot Tests` target by checking its associated checkbox.

### Running the Tests from Xcode

Once that is done, you can run the tests by dropping down the play button down and clicking `Test`.

### Running from the Console

You can also invoke the tests from the command line with the following: 

    xcodebuild -scheme "Car Lot Tests" -sdk iphonesimulator4.3 -configuration Debug clean build


### Running the Tests from Jenkins

You can invoke the tests from Jenkins with the follwing shell command:

    xcodebuild -scheme "Car Lot Tests" -sdk iphonesimulator4.3 -configuration Debug clean build | \
        ${WORKSPACE}/Tools/OCUnit2Junit/ocunit2junit.rb

In order to aggregate the test results in a way that is presentable through Jenkins, you will also
have to check the `Publish JUnit test results` checkbox under the `Post-build Actions`.

## Sources

* [https://github.com/acani/ocmock#readme](https://github.com/acani/ocmock#readme) - Matt Pasquale's fork of the OCMock framework (with updates for more recent versions of Xcode)
* [http://blog.carbonfive.com/2011/04/06/running-xcode-4-unit-tests-from-the-command-line/](http://blog.carbonfive.com/2011/04/06/running-xcode-4-unit-tests-from-the-command-line/) - Jonah William's blog post on running Xcode 4 unit tests from the command line
* [http://blog.jayway.com/2010/01/31/continuos-integration-for-xcode-projects/](http://blog.jayway.com/2010/01/31/continuos-integration-for-xcode-projects/) - Christian Hedin's blog post on continuous testing in XCode

## License

All content is released under the 
[BSD license](https://github.com/damiancarrillo/iPhone-Testing-Example/blob/master/LICENSE.markdown). 
See [this page](http://www.linfo.org/bsdlicense.html) for a plain-text description of what this means.