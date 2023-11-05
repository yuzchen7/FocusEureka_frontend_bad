//
//  PostsViewModel.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import Foundation

class PostsViewModel : ObservableObject{
    //array to store data fetched from backend
    @Published var posts = [Posts]()
    @Published var singlePost:Posts
    
    let baseURL =  "http://localhost:8080/api/posts/"
    
    init (){
        loadData()
    }
    
    func handleRefreash(){
        posts.removeAll()
        loadData()
    }
}

extension PostsViewModel{
    //network calling to backend 
    @MainActor
    func fetchAllPosts() async throws{
        guard let url = URL(string:baseURL) else{
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedPosts = try JSONDecoder().decode([Posts].self, from: data)
            self.posts = fetchedPosts
        } catch {
            print("Error: \(error)")
        }
    }
    
    @MainActor
    func fetchSinglePost(postID: Int) async throws{
        guard let url = URL(string:baseURL+"postId=\(postID)") else{
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedPosts = try JSONDecoder().decode(Posts.self, from: data)
            self.singlePost = fetchedPosts
        } catch {
            print("Error: \(error)")
        }
    }
    
    func loadData() {
        Task (priority: .medium){
            try await fetchAllPosts()
        }
    }
}


