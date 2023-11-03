//
//  ContentView.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import SwiftUI

struct FocusEurekaMainView: View {
    var body: some View {
        //main view of the app
        TabView{
            Group{
                //view that display all the posts fetched from backend
                PostsView()
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
