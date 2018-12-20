//
//  CacheImage.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/17/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation
import UIKit

import AlamofireImage

class ImageCache {
    
   static let shared = ImageCache()
    
    let imageCache = AutoPurgingImageCache()

    func saveImage (image: UIImage , key: String) {
        imageCache.add(image, withIdentifier: key)
    }
    
    
    func fetchImage (key: String) -> Image? {
        return imageCache.image(withIdentifier: key)
    }
    
}




