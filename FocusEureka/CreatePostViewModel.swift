//  FocusEureka
//
//  Created by kai on 11/5/23.
//

import SwiftUI
import PhotosUI

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

}
