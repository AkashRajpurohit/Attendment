# Attendment
## New Age IOT Powered AI based Attendance Solution

I along with my team developed Attendment during 3rd year of Engineering. It is a IOT enabled Attendance Solution.

### Modules
* Arduino UNO
	*	With the help of 1.8 inch128x160 LCD Display Screen, a QR Code is shown to the student to scan and mark attendance
	* HALJIA DS3231 Precision RTC Real Time Clock Module Memory Module AT24C32 I2C is used to store and display time that was encoded in the QR Code
	* XCSOURCE 5PCS 5V 1 Channel Relay Shield Module for allowing to switch on/off the system for certain period of time

* Server & Database - _Java Spring & MySQL_
	* API's for students
	* API's for teachers

* Mobile Application - _Ionic Framework_
	* Student Phase for marking attendance
	* Teacher Phase for registering attendance and viewing reports i.e attendace based on dates, classrooms and subjects

* YOLO Object Detection - _Python_
	* This module was to capture the number of faces detected in the classroom by camera and cross check with the attendances taken in that lecture. If these two data didn't match then a feedback is sent to teacher about the possibility of proxy of any student in the lecture

## I contributed in developing the mobile application and certain phases in IOT Hardware Setup

### The IEEE Paper for this can be read [here](./IEEE_Paper/1858.pdf)

## Visit My Portfolio
[Akash Rajpurohit](https://akashrajpurohit.cf)