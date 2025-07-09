import SwiftUI

/// Digital clock style
public struct DigitalClockStyle: ClockStyle {
    /// The time format style
    public let formatStyle: Date.FormatStyle
    
    /// Creates a digital clock style with the specified time format
    /// - Parameter formatStyle: The format style for displaying time (default: 24-hour format with seconds)
    public init(
        formatStyle: Date.FormatStyle = .dateTime.hour(.twoDigits(amPM: .omitted)).minute(.twoDigits).second(.twoDigits)
    ) {
        self.formatStyle = formatStyle
    }
    
    public func makeBody(configuration: ClockStyleConfiguration) -> some View {
        return Text(configuration.date.formatted(formatStyle))
    }
}

/// Default digital styles
extension ClockStyle where Self == DigitalClockStyle {
    /// Default digital style (24-hour format with seconds)
    public static var digital: DigitalClockStyle {
        DigitalClockStyle()
    }
    
    /// 12-hour digital style (with seconds)
    public static var digital12: DigitalClockStyle {
        DigitalClockStyle(
            formatStyle: .dateTime.hour(.defaultDigits(amPM: .abbreviated)).minute(.twoDigits).second(.twoDigits)
        )
    }
    
    /// Digital style without seconds (24-hour format)
    public static var digitalNoSeconds: DigitalClockStyle {
        DigitalClockStyle(
            formatStyle: .dateTime.hour(.twoDigits(amPM: .omitted)).minute(.twoDigits)
        )
    }
} 