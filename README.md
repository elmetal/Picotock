# Picotock

A SwiftUI clock view with customizable styles.

## Requirements

- Swift 6.1+
- iOS 15.0+ / macOS 12.0+ / watchOS 8.0+ / tvOS 15.0+

## Usage

```swift
import SwiftUI
import Picotock

// Default style
ClockView(current: Date.now)

// Analog style
ClockView(current: Date.now)
    .clockStyle(.analog)
    .frame(width: 200, height: 200)

// Digital style
ClockView(current: Date.now)
    .clockStyle(.digital)

// Custom analog style
ClockView(current: Date.now)
    .clockStyle(AnalogClockStyle(
        faceColor: .black,
        handColor: .white,
        secondHandColor: .red,
        markColor: .gray
    ))
    .frame(width: 200, height: 200)

// Custom digital style
ClockView(current: Date.now)
    .clockStyle(DigitalClockStyle(
        formatStyle: .dateTime.hour().minute().second()
    ))
    .font(.system(size: 24, design: .monospaced))
```

## License

MIT License
