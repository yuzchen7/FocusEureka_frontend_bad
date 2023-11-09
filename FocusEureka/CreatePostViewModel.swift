//  FocusEureka
//
//  Created by kai on 11/5/23.
//

import SwiftUI
import PhotosUI
import FirebaseStorage

@MainActor 
class CreatePostViewModel: ObservableObject{
    @Published var selectedImages: [UIImage] = []
    @Published var inputImages: [PhotosPickerItem] = []{
        didSet{
             setImages(pickedImages: inputImages)
        }
    }
    
    func setImages(pickedImages: [PhotosPickerItem]) {
        Task{
            var images: [UIImage] = []
            for img in pickedImages{
                if let data = try? await img.loadTransferable(type: Data.self){
                    if let result = UIImage(data: data){
                        images.append(result)
                    }
                }
            }
            selectedImages = images
        }
    }
    
    func uploadImage(){
        if selectedImages.isEmpty{
            return
        }
        let storage = Storage.storage().reference()
        for img in selectedImages{
            let imgData = img.pngData()
            guard imgData != nil else{
                return
            }
            let pathRef = storage.child("postImages/\(UUID().uuidString).jpg")
            let uploadTask = pathRef.putData(imgData!, metadata: nil) { metadata, error in
                if (metadata !== nil && error == nil) {
                    
                }
            }
        }
    }

}
