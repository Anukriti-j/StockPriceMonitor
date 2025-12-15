# 📈 Stock Price Monitor

A demonstration iOS application showcasing **Key-Value Observing (KVO)** pattern in Swift. This app allows you to update stock prices and observe real-time updates across multiple view controllers.

## ✨ Features

- **Real-time Price Updates**: Update stock prices and see changes reflected instantly across multiple viewers
- **KVO Implementation**: Demonstrates proper Key-Value Observing pattern with automatic notifications
- **Multiple Viewers**: Two independent price viewer screens that observe the same stock model
- **Price Controls**: Increase, decrease, or set random prices with configurable increments
- **Thread-Safe UI Updates**: Ensures all UI updates happen on the main thread

## Architecture

The app follows a simple MVC architecture:

```
StockPriceMonitor/
├── Models/
│   └── Stock.swift              # Stock model with @objc dynamic property
├── Controllers/
│   ├── HomeViewController.swift           # Main navigation hub
│   ├── PriceUpdateViewController.swift    # Price modification controls
│   ├── PriceViewerAViewController.swift   # First price observer
│   └── PriceViewerBViewController.swift    # Second price observer
└── Resources/
    ├── Main.storyboard          # UI layout
    └── Assets.xcassets          # App icons and colors
```

## Key Concepts Demonstrated

### Key-Value Observing (KVO)

The app demonstrates KVO by:

1. **Observable Model**: The `Stock` class uses `@objc dynamic` to enable KVO notifications
2. **Observer Registration**: View controllers register as observers in `viewDidLoad()`
3. **Change Handling**: Observers receive notifications via `observeValue(forKeyPath:of:change:context:)`
4. **Proper Cleanup**: Observers are removed in `deinit` to prevent memory leaks

### Example Code

```swift
// Model with KVO support
class Stock: NSObject {
    @objc dynamic var price: Double = 0.0
}

// Observer registration
stock.addObserver(self, forKeyPath: "price", options: [.new, .initial], context: nil)

// Handling changes
override func observeValue(forKeyPath keyPath: String?, 
                           of object: Any?, 
                           change: [NSKeyValueChangeKey : Any]?, 
                           context: UnsafeMutableRawPointer?) {
    if keyPath == "price", let newPrice = change?[.newKey] as? Double {
        updateLabelOnMainThread(newPrice)
    }
}
```

## Getting Started

### Prerequisites

- **Xcode 12.0+**
- **iOS 13.0+**
- **Swift 5.0+**

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/StockPriceMonitor.git
cd StockPriceMonitor
```

2. Open the project in Xcode:
```bash
open StockPriceMonitor.xcodeproj
```

3. Build and run the project:
   - Select a simulator or connected device
   - Press `Cmd + R` or click the Run button

## Usage

1. **Launch the app** - You'll see the home screen with three options
2. **Open Price Update** - Tap to modify the stock price
   - Increase: Adds 10.0 to current price
   - Decrease: Subtracts 10.0 from current price
   - Random: Sets price to a random value between 50.0 and 500.0
3. **Open Price Viewer A or B** - View the current stock price
4. **Observe Real-time Updates** - Change the price while viewers are open to see KVO in action

## Learning Objectives

This project is ideal for learning:

- ✅ Key-Value Observing (KVO) pattern
- ✅ `@objc dynamic` properties
- ✅ Observer registration and cleanup
- ✅ Thread-safe UI updates
- ✅ Model-View-Controller architecture
- ✅ Safe optionals and guard statements
- ✅ Memory management with KVO

## Technical Details

### KVO Implementation

- **Observable Property**: `@objc dynamic var price: Double` enables automatic KVO notifications
- **Observer Options**: Uses `.new` and `.initial` to receive both new values and initial state
- **Thread Safety**: Checks `Thread.isMainThread` before updating UI
- **Memory Management**: Properly removes observers in `deinit` to prevent crashes

### Code Quality

- ✅ Safe unwrapping with `guard` statements
- ✅ No force unwrapping (`!`)
- ✅ Proper access control (`private` where appropriate)
- ✅ Constants for magic numbers
- ✅ Weak self in closures to prevent retain cycles

## Project Structure

```
StockPriceMonitor/
├── Models/
│   └── Stock.swift                    # Observable stock model
├── Controllers/
│   ├── HomeViewController.swift       # Navigation hub
│   ├── PriceUpdateViewController.swift # Price modification
│   ├── PriceViewerAViewController.swift # Observer A
│   └── PriceViewerBViewController.swift # Observer B
└── Resources/
    ├── Main.storyboard                # UI layout
    └── Assets.xcassets               # App resources
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Some areas for improvement:

- [ ] Add unit tests for KVO observers
- [ ] Implement Combine framework alternative (iOS 13+)
- [ ] Add error handling and user feedback
- [ ] Support multiple stocks
- [ ] Add price history tracking

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

This project was created as a learning resource to demonstrate KVO patterns in iOS development.

## Additional Resources

- [Apple's KVO Documentation](https://developer.apple.com/documentation/swift/cocoa-design-patterns/using-key-value-observing-in-swift)
- [Swift KVO Guide](https://www.swiftbysundell.com/articles/key-value-observing-in-swift/)

---
