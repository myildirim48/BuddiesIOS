import SwiftUI
import Auth
import Map
import Feed
import Onboarding
import About
import Contributors
import Design
import Login
import Localization

public struct ContentView: View {
    @AppStorage("isSplashScreenViewed") var isOnboardingScreenViewed : Bool = false
    @State private var showSignInView: Bool = false
    
    public init() { }

    public var body: some View {
        SuitableRootView()
    }
    
    @ViewBuilder
    private func SuitableRootView() -> some View {
        if isOnboardingScreenViewed {
            ZStack {
                if !showSignInView {
                    TabFlow()
                }
            }
            .onAppear {
                let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showSignInView = authUser == nil
                try? AuthenticationManager.shared.signOut()
            }
            .fullScreenCover(isPresented: $showSignInView, content: {
                NavigationStack {
                    AuthenticationView(showSignInView: $showSignInView)
                }
            })
        } else {
            OnboardingBuilder.build()
        }
    }
}

struct TabFlow: View {
    @State var selectedTab: AppTab = .feed

    public init() {}
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    L.feed
                }
                .tag(AppTab.feed)
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    L.map
                }
                .tag(AppTab.map)
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle")
                    L.about
                }
                .tag(AppTab.about)
            ContributorsView()
                .tabItem {
                    Image(systemName: "person.3")
                    L.contributors
                }
                .tag(AppTab.contributors)
        }
    }
}
            

enum AppTab: Int, Identifiable {
    case feed = 0
    case map
    case about
    case contributors
    
    var id: Int { rawValue }
}


#Preview {
    ContentView()
}
