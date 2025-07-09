import Foundation

/// A namespace for clock angle calculations
public enum ClockMath {
    
    /// Calculate the hour hand angle (0-360 degrees)
    /// - Parameter date: The date and time to calculate the angle for
    /// - Returns: The hour hand angle with 12 o'clock position as 0 degrees
    public static func hourAngle(from date: Date) -> Double {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        let totalMinutes = Double(hours % 12) * 60 + Double(minutes) + Double(seconds) / 60.0
        return totalMinutes * 0.5 // 12時間で360度 = 30度/時間 = 0.5度/分
    }
    
    /// Calculate the minute hand angle (0-360 degrees)
    /// - Parameter date: The date and time to calculate the angle for
    /// - Returns: The minute hand angle with 12 o'clock position as 0 degrees
    public static func minuteAngle(from date: Date) -> Double {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute, .second, .nanosecond], from: date)
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        let milliseconds = (components.nanosecond ?? 0) / 1_000_000
        
        let totalSeconds = Double(minutes) * 60 + Double(seconds) + Double(milliseconds) / 1000.0
        return totalSeconds * 0.1 // 60分で360度 = 6度/分 = 0.1度/秒
    }
    
    /// Calculate the second hand angle (0-360 degrees)
    /// - Parameter date: The date and time to calculate the angle for
    /// - Returns: The second hand angle with 12 o'clock position as 0 degrees
    public static func secondAngle(from date: Date) -> Double {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second, .nanosecond], from: date)
        let seconds = components.second ?? 0
        let milliseconds = (components.nanosecond ?? 0) / 1_000_000
        
        let totalMilliseconds = Double(seconds) * 1000 + Double(milliseconds)
        return totalMilliseconds * 0.006 // 60秒で360度 = 6度/秒 = 0.006度/ミリ秒
    }
} 