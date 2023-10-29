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
