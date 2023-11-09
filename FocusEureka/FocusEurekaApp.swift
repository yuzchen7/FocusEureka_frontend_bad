//
//  FocusEurekaApp.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import SwiftUI
import Firebase

@main
struct FocusEurekaApp: App {
    var body: some Scene {
        WindowGroup {
            FocusEurekaMainView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
