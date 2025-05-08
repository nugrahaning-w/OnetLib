# Onet

Onet is a lightweight SDK for logging HTTP requests and responses in your iOS application. It provides tools to debug network calls and view logs in a user-friendly interface.

## Features

- Log HTTP requests and responses.
- View logs in a table view with expandable sections.
- Support for error and success responses.
- Dynamic cell height for detailed log previews.
- Compatible with multiple iOS versions.

## Installation

1. Clone the repository or add it as a submodule to your project.
2. Add the `Onet.xcframework` to your Xcode project.
3. Ensure the framework is linked in your target's "Frameworks, Libraries, and Embedded Content" section.

## Usage

### 1. Configure the SDK

Before using the SDK, configure it in your `AppDelegate` or `SceneDelegate`:

```swift
import Onet

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Onet.configure(debugMode: true) // Enable debug mode
        return true
    }
}
```

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

Here is a complete example:

```swift
import Onet

let request = URLRequest(url: URL(string: "https://example.com")!)
Onet.createURLSessionTask(for: request) { data, response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        print("Response received")
    }
}

// Show logs
Onet.showLogs()

// Clear logs
Onet.clearLogs()
```

## Requirements

- iOS 13.0 or later.
- Swift 5.0 or later.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
