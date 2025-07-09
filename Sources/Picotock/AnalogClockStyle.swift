import SwiftUI

/// Analog clock style
public struct AnalogClockStyle: ClockStyle {
    /// The color of the clock face
    public let faceColor: Color
    /// The color of the clock hands
    public let handColor: Color
    /// The color of the second hand
    public let secondHandColor: Color
    /// The color of the hour marks
    public let markColor: Color
    
    /// Creates an analog clock style with customizable colors
    /// - Parameters:
    ///   - faceColor: The color of the clock face (default: white)
    ///   - handColor: The color of the hour and minute hands (default: black)
    ///   - secondHandColor: The color of the second hand (default: red)
    ///   - markColor: The color of the hour marks (default: gray)
    public init(
        faceColor: Color = .white,
        handColor: Color = .black,
        secondHandColor: Color = .red,
        markColor: Color = .gray
    ) {
        self.faceColor = faceColor
        self.handColor = handColor
        self.secondHandColor = secondHandColor
        self.markColor = markColor
    }
    

    
    public func makeBody(configuration: ClockStyleConfiguration) -> some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = size / 2 - 10
            let date = configuration.date
            
            // 角度計算
            let hourAngle = ClockMath.hourAngle(from: date)
            let minuteAngle = ClockMath.minuteAngle(from: date)
            let secondAngle = ClockMath.secondAngle(from: date)
            
            ZStack {
                // 文字盤
                Circle()
                    .foregroundColor(faceColor)
                    .overlay(
                        Circle()
                            .strokeBorder(markColor, lineWidth: 2)
                    )
                    .frame(width: size - 20, height: size - 20)
                
                // 時刻マーク
                ForEach(0..<12, id: \.self) { hour in
                    let angle = Double(hour) * 30 - 90 // 12時を0度とする
                    let markRadius = radius - 15
                    
                    Rectangle()
                        .fill(markColor)
                        .frame(width: 2, height: 15)
                        .position(
                            x: center.x + cos(angle * .pi / 180) * markRadius,
                            y: center.y + sin(angle * .pi / 180) * markRadius
                        )
                        .rotationEffect(.degrees(angle + 90))
                }
                
                // 時針
                Rectangle()
                    .fill(handColor)
                    .frame(width: 4, height: radius * 0.5)
                    .position(
                        x: center.x + cos((hourAngle - 90) * .pi / 180) * radius * 0.25,
                        y: center.y + sin((hourAngle - 90) * .pi / 180) * radius * 0.25
                    )
                    .rotationEffect(.degrees(hourAngle))
                
                // 分針
                Rectangle()
                    .fill(handColor)
                    .frame(width: 3, height: radius * 0.7)
                    .position(
                        x: center.x + cos((minuteAngle - 90) * .pi / 180) * radius * 0.35,
                        y: center.y + sin((minuteAngle - 90) * .pi / 180) * radius * 0.35
                    )
                    .rotationEffect(.degrees(minuteAngle))
                
                // 秒針
                Rectangle()
                    .fill(secondHandColor)
                    .frame(width: 1, height: radius * 0.8)
                    .position(
                        x: center.x + cos((secondAngle - 90) * .pi / 180) * radius * 0.4,
                        y: center.y + sin((secondAngle - 90) * .pi / 180) * radius * 0.4
                    )
                    .rotationEffect(.degrees(secondAngle))
                
                // 中央の丸
                Circle()
                    .fill(handColor)
                    .frame(width: 8, height: 8)
                    .position(center)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

/// Default analog style
extension ClockStyle where Self == AnalogClockStyle {
    /// Default analog style
    public static var analog: AnalogClockStyle {
        AnalogClockStyle()
    }
} 