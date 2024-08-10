import SwiftUI

struct HalfCircleShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.minX, y: rect.midY), radius: rect.height, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
        return path
    }
}

struct BatteryView : View {
    var batteryLevel: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 2) {
                GeometryReader { rectangle in
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(lineWidth: 2)
                    RoundedRectangle(cornerRadius: 3)
                        .padding(1)
                        .frame(width: rectangle.size.width - (rectangle.size.width * (1 - batteryLevel)))
                        .foregroundColor(Color.batteryLevelColor(for: batteryLevel))
                }
                HalfCircleShape()
                    .frame(width: geo.size.width / 7, height: geo.size.height / 7)
            }
            .padding(.leading)
        }
    }
}

extension Color {
    static func batteryLevelColor(for batteryLevel: CGFloat) -> Color {
        switch batteryLevel {
            case 0...0.2:
                return Color.red
            case 0.2...0.5:
                return Color.yellow
            case 0.5...1.0:
                return Color.green
            default:
                return Color.clear
        }
    }
}
