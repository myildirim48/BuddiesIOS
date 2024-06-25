import SwiftUI
import Map
import SwiftData

@main
struct SwiftBuddiesIOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: EventModel.self)
        
        
    }
}
