# Onet

Onet is a lightweight SDK for logging HTTP requests and responses in your iOS application. It provides tools to debug network calls and view logs in a user-friendly interface.

## Features

- Log HTTP requests and responses.
- View logs in a table view with expandable sections.
- Support for error and success responses.
- Dynamic cell height for detailed log previews.

## Installation

1. Swift Package Manager.
File -> Swift Packages -> Add Package Dependency
Enter package URL: https://github.com/nugrahaning-w/OnetLib, and select the latest release.
<img width="420" alt="image" src="https://github.com/user-attachments/assets/be902531-c5a1-4438-b7d7-7cb25dd2dcc4" />


## Usage

### 1. Configure the SDK

Before using the SDK, configure it in your `AppDelegate` or `SceneDelegate`:

```swift
import Onet

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        Onet.configure(debugMode: true)
        #else
        Onet.configure(debugMode: false)
        #endif
        return true
    }
}
```
Ensure that the Onet configuration is enabled only in debug mode to maintain the security of your app in production.

### 2. Log HTTP Requests and Responses

Wrap your `URLRequest` with `Onet` to log requests and responses:

```swift
let request = URLRequest(url: URL(string: "https://example.com")!)
Onet.createURLSessionTask(for: request) { data, response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        print("Response received")
    }
}
```

### 3. View Logs

To view the logs, call the `showLogs()` method:

```swift
Onet.showLogs()
```

This will present a `LogViewController` with a table view of all logged requests and responses.
I recommend triggering showLogs() through a specific action, such as shaking the device or another intentional gesture.

```swift
override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
        Onet.checkDebugStatus()
        Onet.showLogs()
    }
}
```


### 4. Clear Logs

To clear all logs, use the `clearLogs()` method:

```swift
Onet.clearLogs()
```

### 5. Check Debug Mode Status

To verify if the SDK is running in debug mode, call:

```swift
Onet.checkDebugStatus()
```

## Example

You can find an example implementation of this SDK in the following repository:
https://github.com/nugrahaning-w/OnetDemo


## Requirements

- iOS 15.0 or later.
- Swift 5.0 or later.

## Note
This project is open source. Feel free to provide feedback or contribute to the library. You can visit the repository here: [Onet GitHub Repository](https://github.com/nugrahaning-w/Onet). or reach out to me directly at nugrahaning.a.w@gmail.com.

