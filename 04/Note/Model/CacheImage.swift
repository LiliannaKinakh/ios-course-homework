//
//  CacheImage.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/17/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

//class CacheImage {
//    static var sharedCacheImage = CacheImage()
//
//    var cacheImage = NSCache<NSString, UIImage>()
//
//    func saveCachedImage(key: NSString, image: UIImage?) {
//        guard let checkImage = image else {return}
//        _ = self.cacheImage.setObject(checkImage, forKey: key)
//    }
//        func downloadCachedImage(key: NSString) -> UIImage {
//
//            guard let giveImage = self.cacheImage.object(forKey: key) else {return UIImage()}
//            return giveImage
//    }
//}


// MARK: FIXME
class ImageCache {
    
   static let shared = ImageCache()
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000_000,
        preferredMemoryUsageAfterPurge: 60_000_000
    )

    func saveImage (image: UIImage , key: String) {
        imageCache.add(image, withIdentifier: key)
    }
    
    
    func fetchImage (key: String) -> Image? {
        return imageCache.image(withIdentifier: key)
    }
    
}




