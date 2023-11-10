//
//  Created by kai on 11/5/23.
//

import SwiftUI
import PhotosUI
struct CreatePost: View {
    @StateObject var createPostVM = CreatePostViewModel()
    var body: some View {
        VStack{
            Form{
                Section{
                    if !createPostVM.selectedImages.isEmpty{
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack{
                                ForEach(createPostVM.selectedImages, id: \.self) {displayImg in
                                    Image(uiImage: displayImg)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 175, height: 175)
                                }
                            }
                        }
                    }
                    PhotosPicker(selection: $createPostVM.inputImages, matching: .images) {
                        Text("Upload images")
                    }
                }
            }
            Button(action: {
                createPostVM.uploadImage()
            }, label: {
                Text("upload to firebase")
            })
        }
    }
}

#Preview {
    CreatePost()
}

