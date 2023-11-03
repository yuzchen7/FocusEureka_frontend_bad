//
//  Posts.swift
//  FocusEureka
//
//  Created by kai on 10/27/23.
//

import Foundation

import SwiftUI

struct Posts: Codable, Identifiable, Hashable{
    static func == (lhs: Posts, rhs: Posts) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let id: Int
    let title: String
    let contents: String
    let address: String
    let city: String
    let state: String
    let zipcode: String
    let start_date: String?
    let start_time: String?
    let end_date: String?
    let end_time: String?
    let ownerid: Int
    let event: Bool
    let createdAt: String
    let updatedAt: String
    let image_set: Image_set
    let owner: Owner
    let postLikes: [PostLikes]?
}

//struct Image_set: Codable{
//    let post_id: Int
//    let urls: [String]
//}

//struct Owner: Codable {
//    let id: Int
//    let first_name: String
//    let last_name: String
//    let middle_name: String?
//    let username: String
//}

//struct PostLikes: Codable{
//    let user_id: Int
//    let post_id: Int
//    let user: Owner
//    
//}
