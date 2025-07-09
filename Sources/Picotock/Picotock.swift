// Picotock - SwiftUI Clock Display Package
// Each feature is implemented in separate files based on responsibility

// Clock math utilities: ClockMath.swift
// ClockStyle protocol: ClockStyle.swift
// Analog clock style: AnalogClockStyle.swift
// Digital clock style: DigitalClockStyle.swift
// Main view: ClockView.swift
// ViewModifier extensions: ClockStyleModifier.swift

import SwiftUI

#Preview {
    VStack(spacing: 30) {
        // Default style
        VStack {
            Text("Default Style")
                .font(.headline)
            ClockView(current: Date())
                .frame(height: 60)
        }
        
        // Analog style
        VStack {
            Text("Analog Style")
                .font(.headline)
            ClockView(current: Date())
                .clockStyle(.analog)
                .frame(width: 200, height: 200)
        }
        
        // Digital style
        VStack {
            Text("Digital Style")
                .font(.headline)
            ClockView(current: Date())
                .clockStyle(.digital)
                .frame(height: 60)
        }
        
        // Custom analog style
        VStack {
            Text("Custom Analog")
                .font(.headline)
            ClockView(current: Date())
                .clockStyle(AnalogClockStyle(
                    faceColor: .black,
                    handColor: .white,
                    secondHandColor: .yellow,
                    markColor: .gray
                ))
                .frame(width: 200, height: 200)
        }
        
        // Custom digital style
        VStack {
            Text("Custom Digital")
                .font(.headline)
            ClockView(current: Date())
                .clockStyle(DigitalClockStyle(
                    formatStyle: .dateTime.hour(.defaultDigits(amPM: .abbreviated)).minute(.twoDigits).second(.twoDigits)
                ))
                .font(.system(size: 24, design: .monospaced))
                .foregroundColor(.green)
                .padding(8)
                .background(.black)
                .cornerRadius(6)
                .frame(height: 60)
        }
    }
    .padding()
}
