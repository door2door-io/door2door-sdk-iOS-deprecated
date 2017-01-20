[![Build Status](https://travis-ci.com/door2door-io/mobility-analytics-sdk-ios.svg?token=mxhR6CvH5qpkhU4ysi1n&branch=develop)](https://travis-ci.com/door2door-io/mobility-analytics-sdk-ios)

# D2DEventCollectionKit
A **dependency free** plug and play API wrapper to send event data to the Door2Door event collection backend for mobility events.
	
##Table of contents

1. [Technical requirements](#1.Technical Requirements)
2. [Setup](#2-setup)
3. [Guide](#3-guide)
4. [Reference](#4-reference)
5. [License](#5-license)

## 1. Technical Requirements

The event collection API wrapper can be used with ``Swift 3.x`` and higher as well as with ``Objective-C``. We also made it usable with your most beloved dependency manager. You have the choice. 

 * ``Swift 3.x``
 * ``Objective-C``
 * ``Cocoapods``
 * ``Carthage``
 * Use the ``Xcode project`` directly in your project

**Demo projects:** Please also check the demo projects to see how to implement the SDK, set it up, create an event and send it to the backend. There is one demo project for ``Objective-C`` and one for ``Swift`` based implementations. 

To embed the ``D2DEventCollectionKit`` your project needs to have at least the following two build configurations a. ``Debug`` an b. ``Release``. You can have more if needed but at least these two should be present and used. 
 
**Build configurations on a project level**
![Link Binary](Documentation/img/Build-Configurations.png)


## 2 Setup

Choose the way you want to integrate the SDK into your project. 

###2.1 CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

	$ gem install cocoapods

To integrate D2DEventCollectionKit into your Xcode project using CocoaPods, specify it in your Podfile:

	source 'https://github.com/CocoaPods/Specs.git'
	platform :ios, '10.0'
	use_frameworks!
	
	target '<Your Target Name>' do
    	pod 'D2DEventCollectionKit', '~> 0.1.1'
	end

Then, run the following command:

	$ pod install

###2.2 Manual Setup <br>
If you use our SDK without any dependency manager please drag the ``D2DEventCollectionKit.xcodeproj`` file into your project where you want to make use of the provided functionality. Go to your project settings and set the ``Target Dependency``, ``Link Binary with Libraries`` and ``Framework Path Mapping`` like in the images shown beneath. Please set these settings for all the targets you are using. 

**Link Binary with Libraries**
![Link Binary](Documentation/img/Link-Binary.png)

**Target Dependecy**
![Target Dependecy](Documentation/img/Target-Dependecy.png)

**Embeded Frameworks**
![Embed Frameworks](Documentation/img/Embed-Frameworks.png)

In your ``Build Settings`` add (create by using the + symbol on top) a set of user-defined variables like this and name them ``FRAMEWORK_PATH_MAPPING`` like in the example beneath. On the right side the given build configurations can be used to do your mapping: ``Release`` and ``Debug``.

**Framework Path Mapping**
![Target Dependecy](Documentation/img/Mapping.png)
The right side shows your ``build configurations``. You need to map them one by one to the predefined ones used by the SDK.

This step is needed if your environment variables are not using the Xcode defaults but we recommend this step. If you ran your project in Xcode's predefined settings, nothing is needed. *NOTE:* If you have multiple separate targets you need to specify these settings on a per target level.

Once this is done, you neet to add the following variable to do the mapping: ``Framework Search Path``, and add the following entry: 

Set: ``$(BUILD_DIR)/$(FRAMEWORK_PATH_MAPPING)$(EFFECTIVE_PLATFORM_NAME)``

Now go to your ``ApplicationDelegate`` and add the module import statement ``import D2DEventCollectionKit`` an that's it. 

**Happy integrating!**
## 3. Guide

Ones you are done with the integration of the SDK with your most beloved dependency manager it's time to use the SDK. Setting it up is pretty easy. The same applies for the use of the SDK when using Objective-C. The ``D2DEventCollectionKitDemoObjc`` demo shows you the integration process for Objective-C. 

###Setup
 
In your application delegate implement the following: 

	 EventCollectionKit.register(applicationToken: "YOUR_APP_TOKEN_GOES_HERE",
                            	 applicationName: "Your application name",
                             	 applicationVersion: "1.0")
                             	 
Once this is done you can enable/disable debug output. The debug output is disabled by default. 
	
	EventCollectionKit.enable(logging: true)
	
### Create Events
Creating and sending an event is pretty straight forward. To create an event for a ``route`` with its action ``search`` you use the convenience method on the ``TripEvent`` object like in the example beneath. 

**Note:** *To be as accurate as possible we encourage you to provide coordinate data for ``latitude`` and ``longitude`` for the tracking. If you can't provide concrete data for the 2 fields please send ``0.0`` for each field and specify the ``address`` fields.*


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
Once you have created an event like this you just need to send it by using the ``EventCollectionKit`` ``send:`` function. That's it. You can see the list of events and its parameter definitions in the SDK itself or you will find it in the [Reference section](#Reference) section.

        EventCollectionKit.send(event: tripSearchEvent)

	
## 4. Reference
To make the SDK as easy to use as possible we have mapped the possible event types to class functions of type ``TripEvent``. A ``TripEvent`` can have multiple actions attached to it which defines the state for a trip. The list beneath shows the existing actions and their corresponding class functions for convenience.    
<br>
Since the SDK supports ``Swift`` and ``Objective-C`` there are two convinience class functions per event implemented. One for ``Swift`` and one for ``Objective-C``. When using ``Swift`` you can potentially choose which one to use but we encourage using the function with the typed signature where the ``modesOfTransportation`` is of type ``[ModesOfTransportation]``. The ``Objective-C`` implementation uses the signature ``modesOfTransportation`` with its type ``[NSNumber]``. 
<br>
The ``ModesOfTransportation`` swift enum defines the available modes of transportation and can be mapped into values from ``0 - 8`` which should be used as ``NSNumber``'s if you are using the SDK in ``Objective-C``. 
<br>

**For example** ``ModesOfTransportation.taxi`` in swift would map to the ``NSNumber`` ``@(ModesOfTransportationTaxi)`` using Objective-C.
<br>    

	public enum ModesOfTransportation: Int {
		case train // 0
 		case walk // 1
	 	case publicTransport // 2
    	case carSharing // 3
    	case bikeSharing // 4
    	case taxi // 5
    	case privateBike // 6
    	case rideSharing // 7
    	case other // 8
    }
You can find the corresponding method signatures for ``TripEvent`` events at ``Source/Events/Trip`` in the project. 
<br>  

#### Trip Search
A user is searching how to get from A to B. 

	TripEvent.tripSearchEvent(...)

#### Trip Begin
A user starts getting from A to B.

	TripEvent.tripBeginEvent(...)

#### Trip Cancel
A user cancels a booked trip.
	
	TripEvent.tripCancelEvent(...)
	
#### Trip End
A user reached their destination. 
		
	TripEvent.tripEndEvent(...)
	
#### Trip Interest
A user examines the details of a search result. This happens if a search returns multiple results.

	TripEvent.tripInterestEvent(...)
	
#### Trip Pay
A user pays for getting from A to B.
		
	TripEvent.tripPayEvent(...)

## 5. License
D2DEventCollectionKit is released under the MIT license. See LICENSE for details.

