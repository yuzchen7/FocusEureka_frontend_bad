import SwiftUI
import Firebase

@main
struct FocusEurekaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
