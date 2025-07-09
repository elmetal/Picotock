import Testing
import Foundation
@testable import Picotock

@Test func analogClockStyleInitialization() async throws {
    let style = AnalogClockStyle()
    
    // デフォルト値の確認
    #expect(style.faceColor == .white)
    #expect(style.handColor == .black)
    #expect(style.secondHandColor == .red)
    #expect(style.markColor == .gray)
}

@Test func digitalClockStyleInitialization() async throws {
    let style = DigitalClockStyle()
    
    // デフォルトのformatStyleが設定されていることを確認（24時間表示、秒あり）
    let testDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 15, minute: 30, second: 45))!
    let formattedTime = testDate.formatted(style.formatStyle)
    #expect(formattedTime == "15:30:45")
}

@Test func clockStyleConfiguration() async throws {
    let calendar = Calendar.current
    let components = DateComponents(year: 2024, month: 1, day: 1, hour: 12, minute: 0, second: 0)
    let date = calendar.date(from: components)!
    
    let config = ClockStyleConfiguration(date: date)
    
    #expect(config.date == date)
}

@Test func digitalClockStyleCustomFormat() async throws {
    // カスタムフォーマットでスタイルを作成（12時間表示）
    let customFormat = Date.FormatStyle.dateTime.hour(.defaultDigits(amPM: .abbreviated)).minute(.twoDigits)
    let style = DigitalClockStyle(formatStyle: customFormat)
    
    let testDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 15, minute: 30, second: 45))!
    
    // en_USロケールで12時間表示をテスト
    let enUSLocale = Locale(identifier: "en_US")
    let formattedTime = testDate.formatted(style.formatStyle.locale(enUSLocale))
    
    // 12時間表示（AMPMの前にnon-breaking space \u{202f}が使用される）
    #expect(formattedTime == "3:30\u{202f}PM")
}

@Test func digitalClockStyleConvenienceMethods() async throws {
    let testDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1, hour: 15, minute: 30, second: 45))!
    let enUSLocale = Locale(identifier: "en_US")
    
    // digital（24時間表示、秒あり）
    let digitalStyle = DigitalClockStyle.digital
    #expect(testDate.formatted(digitalStyle.formatStyle) == "15:30:45")
    
    // digital12（12時間表示、秒あり）
    let digital12Style = DigitalClockStyle.digital12
    let formatted12 = testDate.formatted(digital12Style.formatStyle.locale(enUSLocale))
    #expect(formatted12 == "3:30:45\u{202f}PM")
    
    // digitalNoSeconds（24時間表示、秒なし）
    let digitalNoSecondsStyle = DigitalClockStyle.digitalNoSeconds
    #expect(testDate.formatted(digitalNoSecondsStyle.formatStyle) == "15:30")
} 