import SwiftUI
import Auth
import Login
import Onboarding

struct RootView: View {
    @AppStorage("isSplashScreenViewed") var isOnboardingScreenViewed : Bool = false
    @State private var showSignInView: Bool = false
    
    init() { }

    var body: some View {
        SuitableRootView()
    }
    
    @ViewBuilder
    private func SuitableRootView() -> some View {
        if isOnboardingScreenViewed {
            ZStack {
                if !showSignInView {
                    TabFlowView(showSignInView: $showSignInView)
                }
            }
            .onAppear {
                let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showSignInView = authUser == nil
            }
            .fullScreenCover(isPresented: $showSignInView, content: {
                AuthenticationView(showSignInView: $showSignInView)
            })
        } else {
            OnboardingBuilder.build()
        }
    }
}

#Preview {
    RootView()
}