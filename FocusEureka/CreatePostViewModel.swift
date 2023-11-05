//  FocusEureka
//
//  Created by kai on 11/5/23.
//

import SwiftUI
import PhotosUI

class CreatePostViewModel: ObservableObject{
    @Published var selectedImage: UIImage? = nil
    @Published var inputImage: PhotosPickerItem? = nil
}
