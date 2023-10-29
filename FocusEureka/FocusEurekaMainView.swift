//
//  ContentView.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import SwiftUI

struct FocusEurekaMainView: View {
    var body: some View {
        TabView{
            Group{
                AllPostsView()
                    .tabItem {
                        Image(systemName: "globe.americas")
                            .frame(height:500)
                        Text("Expore")
                    }
                Text("Account")
                    .tabItem{
                        Text("tab2")
                    }
                Text("Tab3")
                    .tabItem {
                        Text("tab3")
                    }
            }
            .toolbarBackground(.pink, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    FocusEurekaMainView()
}
