[![Build Status](https://travis-ci.com/door2door-io/mobility-analytics-sdk-ios.svg?token=mxhR6CvH5qpkhU4ysi1n&branch=develop)](https://travis-ci.com/door2door-io/mobility-analytics-sdk-ios)

# D2DEventCollectionKit
A **dependency free** plug and play API wrapper to send event data to the Door2Door event collection backend for mobility events.
	
##Table of contents

1. [Technical requirements](#1.Technical Requirements)
2. [Guide](#2.Guide)
3. [Reference](#3.Reference)
4. [Support](#4.Support) 
5. [Todo](Documentation/todo.md)


## 1. Technical Requirements

The event collection API wrapper can be used with ``swift 3.x`` and higher as well as with ``Objective-C``. We also made it usale with your most beloved dependecy manager. You have the choice. 

 * ``Swift 3.x``
 * ``Objective-C``
 * ``Cocoapods``
 * ``Carthage``
 * Use the ``Xcode project`` directly in your project


## 2. Guide

Ones you are done with the integration of the sdk with your most beloved dependecy manager its time to use the sdk. Setting it up is pretty easy. The same applies for the use of the sdk when using Objective-C. The ``D2DEventCollectionKitDemoObjc`` demo shows you the integration process for Objective-C. 

###Setup
 
In your application delegate implement the following: 

	 EventCollectionKit.register(applicationToken: "YOUR_APP_TOKEN_GOES_HERE",
                            	 applicationName: "Your application name",
                             	 applicationVersion: "1.0")
                             	 
Once this is done you can enable/disable debug output. The debug output is disabled by default. 
	
	EventCollectionKit.enable(logging: true)
	
### Create Events
Creating and sending an event is pretty straight forward. To create an event for a ``route`` with its action ``search`` you use the convenience method on the ``TripEvent`` object like in the example beneath. 

	let tripSearchEvent  = TripEvent.tripSearchEvent(modesOfTransportation:[.train, .taxi],
                                                     departureTime: Date(),
                                                     originLatitude: 52.5230554,
                                                     originLongitude: 13.4122575,
                                                     originName: "Alexanderplatz",
                                                     originStreet: "Alexanderplatz",
                                                     originCity: "Berlin",
                                                     originPostalCode: "10119",
                                                     originCountry: "Germany",
                                                     arrivalTime: nil,
                                                     destinationLatitude: 52.5300641,
                                                     destinationLongitude: 13.4008385,
                                                     destinationName: "Door2Door HQ",
                                                     destinationStreet: "Torstrasse 109",
                                                     destinationCity: "Berlin",
                                                     destinationPostalCode: "10178",
                                                     destinationCountry: "Germany")

### Sending events
Once you have created an event like this you just need to send it by using the ``EventCollectionKit`` ``send:`` function. Thats it. You can see the list of events and its parameter definitions in the sdk itself or you will find it in the [Reference section](#Reference) section

        EventCollectionKit.send(event: tripSearchEvent)

	
## 3. Reference
To make the SDK as easy to use as possible we have mapped the possible event types to class functions of type ``TripEvent``. A ``TripEvent`` can have multiple actions attached to it which defines the state for a trip. The list beneath shows the existing actions and their corresponding class functions for convenience.  

#### Trip Search

	TripEvent.tripSearchEvent(...)

#### Trip Begin
		
	TripEvent.tripBeginEvent(...)
	
#### Trip Book
		
	TripEvent.tripBookEvent(...)

#### Trip Cancel
		
	TripEvent.tripCancelEvent(...)
	
#### Trip End
		
	TripEvent.tripEndEvent(...)
	
#### Trip Interest
		
	TripEvent.tripInterestEvent(...)
	
#### Trip Pay
		
	TripEvent.tripPayEvent(...)
	
#### Trip Search
		
	TripEvent.tripSearchEvent(...)
	

## 4. Support

tech@door2door.io (Or something like that.)