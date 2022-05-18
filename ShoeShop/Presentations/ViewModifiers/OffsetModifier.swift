import SwiftUI

struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(GeometryReader { proxy -> Color in
            let minY = proxy.frame(in: .named("HomeScroller")).minY
            
            print("MIN_Y: \(minY)")
            
            DispatchQueue.main.async {
                self.offset = minY
            }
            
            return Color.clear
        }, alignment: .top)
    }
}
