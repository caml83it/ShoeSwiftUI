import SwiftUI

enum AppRoute {
    case kSignIn
    case kSignUp
    case kHome
}

protocol Routing {
  associatedtype Route
  associatedtype View: SwiftUI.View
 
  @ViewBuilder func view(for route: Route) -> Self.View
}


class AppRouter: Routing {
    
    static let shared: AppRouter = AppRouter()
    
    private init() {}
    
    func view(for route: AppRoute) -> some View {
        switch(route) {
            case .kSignIn: LoginView()
            case .kSignUp: SignUpView()
            case .kHome: HomeView()
        }
    }
}
