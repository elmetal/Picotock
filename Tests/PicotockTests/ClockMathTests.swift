import Testing
import Foundation
@testable import Picotock

@Test func clockMathHourAngle() async throws {
    let calendar = Calendar.current
    
    // 12時ちょうど（0度）
    let noon = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 0))!
    #expect(ClockMath.hourAngle(from: noon) == 0.0)
    
    // 3時ちょうど（90度）
    let three = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 3, minute: 0, second: 0))!
    #expect(ClockMath.hourAngle(from: three) == 90.0)
    
    // 6時ちょうど（180度）
    let six = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 6, minute: 0, second: 0))!
    #expect(ClockMath.hourAngle(from: six) == 180.0)
    
    // 9時ちょうど（270度）
    let nine = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 9, minute: 0, second: 0))!
    #expect(ClockMath.hourAngle(from: nine) == 270.0)
    
    // 1時30分（45度）
    let oneThirty = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 1, minute: 30, second: 0))!
    #expect(ClockMath.hourAngle(from: oneThirty) == 45.0)
}

@Test func clockMathMinuteAngle() async throws {
    let calendar = Calendar.current
    
    // 0分（0度）
    let zero = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 0))!
    #expect(ClockMath.minuteAngle(from: zero) == 0.0)
    
    // 15分（90度）
    let fifteen = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 15, second: 0))!
    #expect(ClockMath.minuteAngle(from: fifteen) == 90.0)
    
    // 30分（180度）
    let thirty = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 30, second: 0))!
    #expect(ClockMath.minuteAngle(from: thirty) == 180.0)
    
    // 45分（270度）
    let fortyFive = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 45, second: 0))!
    #expect(ClockMath.minuteAngle(from: fortyFive) == 270.0)
    
    // 30秒（3度）
    let thirtySeconds = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 30))!
    #expect(ClockMath.minuteAngle(from: thirtySeconds) == 3.0)
}

@Test func clockMathSecondAngle() async throws {
    let calendar = Calendar.current
    
    // 0秒（0度）
    let zero = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 0))!
    #expect(ClockMath.secondAngle(from: zero) == 0.0)
    
    // 15秒（90度）
    let fifteen = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 15))!
    #expect(ClockMath.secondAngle(from: fifteen) == 90.0)
    
    // 30秒（180度）
    let thirty = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 30))!
    #expect(ClockMath.secondAngle(from: thirty) == 180.0)
    
    // 45秒（270度）
    let fortyFive = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 45))!
    #expect(ClockMath.secondAngle(from: fortyFive) == 270.0)
} 