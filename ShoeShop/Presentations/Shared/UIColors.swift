import SwiftUI

extension Color {
    static let background = Color.init(hex: "FFFFFF")
    static let btnTextTitle = Color.init(hex: "FFFFFF")
    static let primaryColor = Color.init(hex: "F05C09")
    static let textTitle = Color.init(hex: "07120E")
    static let subTitle = Color.init(hex: "777D7A")
    static let hint = Color.textTitle.opacity(0.5)
    static let dot = Color.init(hex: "C4C4C4")
    static let inputBorder = Color.init(hex: "E4E4E4")
    
    init(hex: String, with alpha: Double = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            opacity: alpha
        )
    }
}
