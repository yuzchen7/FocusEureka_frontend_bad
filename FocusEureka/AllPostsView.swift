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
            //display the title of each posts
            List{
                ForEach(postVM.posts){ post in
                    AsyncImage(url: URL(string: post.image_set.urls[0]))
                        .frame(height: 50)
                    Text("\(post.title)")
                }
            }
            .refreshable{
                postVM.handleRefreash()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AllPostsView()
}
