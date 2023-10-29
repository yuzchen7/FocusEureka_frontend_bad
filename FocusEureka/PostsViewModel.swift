//
//  PostsViewModel.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import Foundation

class PostsViewModel : ObservableObject{
    @Published var posts = [Posts]()
    let baseURL =  "http://localhost:8080/api/posts/"
    
    
    init (){
        loadData()
    }
    
    func handleRefreash(){
        print("handle refresh triggered")
        posts.removeAll()
        loadData()
    }
}

extension PostsViewModel{
    @MainActor
    func fetchAllPosts() async throws{
        guard let url = URL(string:baseURL) else{
            return
        }
        do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let fetchedPosts = try JSONDecoder().decode([Posts].self, from: data)
                    self.posts = fetchedPosts // Assign fetched posts to self.posts
                } catch {
                    print("Errorrrrrrrrrrrrrrrrrrrrr: \(error)")
                }
    }
    
    func loadData() {
        print("triigged load data")
        Task (priority: .medium){
            try await fetchAllPosts()
        }
    }
}


