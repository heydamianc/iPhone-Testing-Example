# Unit Tests in Xcode

When you create a new project and indicate that you would like to include unit tests, Xcode will
add an additional target.  This target will run whenever you hold on the play button for a while,
then select `Test` from the dropdown menu.  This is useful for development, however is limited in 
its scope because you can not build this target and run it from he command line. When you try to,
everything will build correctly, however it behaves as if it doesn't hit the final run script 
phase of the target (this is the script that runs the unit tests).

## Project Setup

I'm not sure why the project is initially created that way, but I do know that you can fix it with 
the following steps:  

* Select the root-level icon (blueprint) in the Project navigator
* Under the `Targets` section, remove the old testing target
* Click the `Add Target` button
* Select the `Cocoa Touch Unit Testing Bundle` from the `Other` category under the `iOS` section
* Click `Next`
* Enter a product name and click `Finish`

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

Once that is done, you can run the tests by dropping down the play button down and clicking `Test`

### Running from the Console

You can also invoke the tests from the command line with the following: 

    xcodebuild -scheme "Car Lot Tests" -sdk iphonesimulator4.3 -configuration Debug clean build