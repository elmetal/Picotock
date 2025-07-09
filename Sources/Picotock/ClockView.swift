import SwiftUI

/// The main view that displays a clock
public struct ClockView: View {
    /// The current date and time
    public let current: Date
    
    /// Get ClockStyle from environment
    @Environment(\.clockStyle) private var clockStyle
    
    /// Creates a clock view that displays the specified date and time
    /// - Parameter current: The date and time to display
    public init(current: Date) {
        self.current = current
    }
    
    public var body: some View {
        // Use ClockStyle from environment
        clockStyle.makeBody(configuration: ClockStyleConfiguration(date: current))
    }
} 