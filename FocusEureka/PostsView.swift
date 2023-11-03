//
//  AllPostsView.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import SwiftUI

struct PostsView: View {
    @StateObject var postVM = PostsViewModel()
    var body: some View {
        NavigationStack{
            //display the title of each posts
            List{
                ForEach(postVM.posts){ post in
                    NavigationLink(
                        value: post
                    ){
                        VStack{
                            HStack{
                                AsyncImage(url: URL(string: post.image_set.urls[0])) { fetchedImage in
                                    fetchedImage
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            HStack{
                                Text("\(post.title)")
                            }
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Interesting Spot")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Posts.self, destination: { detailPost in
                DetailedPostView(detailedPost: detailPost)
            })
            .cornerRadius(10)
            .refreshable{
                postVM.handleRefreash()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PostsView()
}
