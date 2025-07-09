import SwiftUI

/// A protocol that defines a clock style
public protocol ClockStyle {
    /// The body type used by this style
    associatedtype Body: View
    
    /// Receives time data and returns a view with the style applied
    func makeBody(configuration: ClockStyleConfiguration) -> Self.Body
}

/// Configuration information for ClockStyle
public struct ClockStyleConfiguration {
    /// The current date and time
    public let date: Date
    
    /// Creates a configuration with the specified date and time
    public init(date: Date) {
        self.date = date
    }
} 