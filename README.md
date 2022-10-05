# WeatherHive Application
WeatherHive is a mobile application developed using Flutter. It supports both Android and IOS.

WeatherHive is a weather application. It allows the know the weather in your location and other locations,

## Table of contents
- ### [main packages used](https://github.com/Atevaz/hotel-booking/blob/master/README.md#main-packages-used-1)
- ### [Folder structure](https://github.com/Atevaz/hotel-booking/blob/master/README.md#folder-structure-1)
- ### [Screenshots 📷](https://github.com/Atevaz/hotel-booking/blob/master/README.md#screenshots)
- ### [Demo video 📹](https://github.com/Atevaz/hotel-booking/blob/master/README.md#demo-video)

## Main packages used
- [dio](https://pub.dev/packages/dio) to make integration with API
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) as state management
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) to make the application responsive
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) to handle internet connection
- [flutter_offline](https://pub.dev/packages/flutter_offline) to handle offline/online connectivity like a Boss

## Folder structure
We have applied clean archeticture concept and here is the basic folder structure:

```
WeatherHive
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

Here is the folder structure we have been using in this project:
```
lib
├── business_logic
├── core
├── data
├── presentation
└── main.dart
```

### business_logic
This folder contains the business logic of the application specificly state management.

```
business_logic
├── global_cubit
└── bloc_observer.dart
```

### constant
This folder contains all constant of app and endpoint of api
```
constant
├── constant.dart
└── endpoint.dart
```

### data
This folder contains all models and dio_helper files that deals with data that come from api
```
data
├── model
└── network
```

### presentation
This folder contains everything related to the screen of the application.
```
presentation
├── components
├── router
├── screens
├── styles
└── view
```

### Demo

https://user-images.githubusercontent.com/101355785/189496364-5733edb4-cea5-43a1-a336-6acaddc367c6.mp4



