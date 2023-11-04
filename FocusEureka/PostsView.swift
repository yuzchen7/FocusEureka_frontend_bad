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
            ScrollView{
                ForEach(postVM.posts){ post in
                    NavigationLink(
                        value: post
                    ){
                        VStack{
                            VStack(spacing:10){
                                HStack{
                                    AsyncImage(url: URL(string: post.image_set.urls[0])) { fetchedImage in
                                        fetchedImage
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                HStack{
                                    Text("\(post.title)")
                                }
                            }
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: UIScreen.main.bounds.width/2-25)
                            .padding()
                        }
                        
                        VStack{
                            VStack(){
                                HStack{
                                    AsyncImage(url: URL(string: post.image_set.urls[0])) { fetchedImage in
                                        fetchedImage
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                HStack{
                                    Text("\(post.title)")
                                }
                            }
                            .background(.white)
                            .frame(width: UIScreen.main.bounds.width/2-25)
                            .padding()
                        }
                    }
                }
            }
            .background(.gray.opacity(0.2))
            .navigationTitle("Interesting Spot")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Posts.self, destination: { detailPost in
                DetailedPostView(detailedPost: detailPost)
            })
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
