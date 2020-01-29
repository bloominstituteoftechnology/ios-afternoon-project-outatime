

#### In `TimeCircuitsViewController`

* Set the `destinationTimeLabel` with the date received from the picker view controller using the date formatter object in the `destinationDateWasChosen` method.
* Call a method `startTimer` in the `IBAction` that is called when the travel back button is tapped.
* In the `startTimer` method, initialize the timer object for a 0.1 sec time interval. Set it to fire a method that updates the speed label.
* In the `resetTimer` method, stop the timer (there is a method you can call to do this, see our project from today) and then set it to nil.
* In the `updateSpeed` method:
	* Check if the current speed variable has reached 88. If we have NOT:
		* Increment the current speed variable by 1.
		* Update the speed label with the current speed.
	* Once the speed has reached at least 88, stop the timer.
		* Update the value of the `lastTimeDepartedLabel` with the value from the `presentTimeLabel`.
		* Update the value of the `presentTimeLabel` with the value from the `destinationTimeLabel`.
		* Reset the value of the current speed variable to 0.
		* Show an alert view with a title "Time Travel Successful" and a message that says "You're new date is [insert present time here].".

## UI Previews

#### The Time Circuits View on App Launch
![](https://raw.githubusercontent.com/LambdaSchool/ios-afternoon-project-outatime/master/time-circuits.png)

#### A Modal View for Choosing a Date
![](https://raw.githubusercontent.com/LambdaSchool/ios-afternoon-project-outatime/master/date-picker-modal.png)
