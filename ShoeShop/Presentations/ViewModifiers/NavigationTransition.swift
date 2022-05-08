import SwiftUI
import SwiftUIRouter

struct NavigationTransition: ViewModifier {
    @EnvironmentObject private var navigator: Navigator
    
    private func transition(for direction: NavigationAction.Direction?) -> AnyTransition {
        if direction == .deeper || direction == .sideways {
            return AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
        }
        else {
            return AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .animation(.default, value: navigator.path)
            .transition(transition(for: navigator.lastAction?.direction))
    }
}
