//
//  AllPostsView.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import SwiftUI

struct AllPostsView: View {
    @StateObject var postVM = PostsViewModel()
    var body: some View {
        NavigationStack{
            Text("afasfafsa")
            List{
                ForEach(postVM.posts){ post in
                    Text("\(post.title)")
                }
            }
            .refreshable{
                print("triggerd")
                postVM.handleRefreash()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AllPostsView()
}
