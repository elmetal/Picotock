import SwiftUI

/// Type-erased ClockStyle wrapper
internal struct AnyClockStyle {
    private let _makeBody: (ClockStyleConfiguration) -> AnyView
    
    init<Style: ClockStyle>(_ style: Style) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }
    
    func makeBody(configuration: ClockStyleConfiguration) -> AnyView {
        _makeBody(configuration)
    }
}

/// EnvironmentKey for ClockStyle
internal struct ClockStyleEnvironmentKey: EnvironmentKey {
    nonisolated(unsafe) static let defaultValue: AnyClockStyle = AnyClockStyle(DefaultClockStyle())
}

extension EnvironmentValues {
    /// The current ClockStyle
    internal var clockStyle: AnyClockStyle {
        get { self[ClockStyleEnvironmentKey.self] }
        set { self[ClockStyleEnvironmentKey.self] = newValue }
    }
}

/// Default ClockStyle
private struct DefaultClockStyle: ClockStyle {
    func makeBody(configuration: ClockStyleConfiguration) -> some View {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: configuration.date)
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        return VStack {
            Text("\(hours, specifier: "%02d"):\(minutes, specifier: "%02d"):\(seconds, specifier: "%02d")")
                .font(.system(.title, design: .monospaced))
        }
    }
}

/// ViewModifier that applies ClockStyle
private struct ClockStyleModifier<Style: ClockStyle>: ViewModifier {
    let style: Style
    
    func body(content: Content) -> some View {
        content
            .environment(\.clockStyle, AnyClockStyle(style))
    }
}

/// View extension that provides clockStyle method
extension View {
    /// Apply clock style
    public func clockStyle<Style: ClockStyle>(_ style: Style) -> some View {
        self.modifier(ClockStyleModifier(style: style))
    }
}

 