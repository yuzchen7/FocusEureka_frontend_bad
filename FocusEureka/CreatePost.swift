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
                    
                }
            }
            PhotosPicker(selection: $createPostVM.inputImage) {
                Text("Click to add photo")
            }
        }
    }
}

#Preview {
    CreatePost()
}
