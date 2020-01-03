//
//  UimageExtension.swift
//  PhotoNote
//
//  Created by brian vilchez on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func convertToString() -> String? {
        let data: Data? = self.pngData()
              return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
