# iddog


## Project Specifications
This is an iOS app made in XCode 11.2.1 with Swift 5.

The architecture in this code is based on MVVM, and the project classes are organized in the following folders:
- Global Use 
  - Global constants;
  - UserDefaults configuration
  - Helpers
- Delegates
- Controllers
- ViewModels
- Models
- Networking
  - API requests setup

It uses CocoaPods such as:
- Alamofire for networking requests
- SDWebImage to cache images

## Running the project
To run the application, all you have to do is:
1. Download the project
2. Run `pod install` in Terminal
3. Open `.xcworkspace` in XCode
4. Run the project in any simulator device you want

## Tests
This project has some Unit Tests in `iddogTests` folder.
