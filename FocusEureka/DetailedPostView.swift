//
//  DetailedPostView.swift
//  FocusEureka
//
//  Created by kai on 11/2/23.
//

import SwiftUI

struct DetailedPostView: View {
    var detailedPost:Posts
    var body: some View {
        VStack{
            TabView{
                ForEach(detailedPost.image_set.urls, id: \.self){picture in
                    AsyncImage(url: URL(string:picture)) { detailedImage in
                        detailedImage
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height:250)
            HStack{
                Text(detailedPost.contents)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailedPostView(
        detailedPost:
            Posts(
                id: 6,
                title: "Kinokuniya",
                contents: "Azaming book shop where you can buy manga and figures for your favorite anime",
                address: "1073 Avenue of the Americas",
                city: "New York",
                state: "NY",
                zipcode: "10018",
                start_date: nil,
                start_time: Optional("10:00"),
                end_date: nil,
                end_time: Optional("20:00"),
                ownerid: 2,
                event: false,
                createdAt: "2023-11-02T23:12:16.781Z",
                updatedAt: "2023-11-02T23:12:16.781Z",
                image_set: FocusEureka.Image_set(
                    post_id: 6,
                    urls: ["https://images.squarespace-cdn.com/content/v1/571abd61e3214001fb3b9966/1518814837468-LZXSJ9HHAUX6YEDZQMF9/entrance.jpg?format=2500w", "https://images.squarespace-cdn.com/content/v1/571abd61e3214001fb3b9966/1518814402334-EDMWCIKTFR4TDOSG0SVP/IMG_1374.jpg?format=2500w"]),
                owner: FocusEureka.Owner(
                    id: 2,
                    first_name: "Kaifeng",
                    last_name: "Yu",
                    middle_name: nil,
                    username: "Kaifeng99890@gmail.com"),
                post_likes: nil)
    )
}
