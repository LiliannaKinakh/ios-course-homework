//
//  CacheImage.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/17/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation
import UIKit
class CacheImage {
    static var sharedCacheImage = CacheImage()
    
    var cacheImage = NSCache<NSString, UIImage>()
    
    func saveCachedImage(key: NSString, image: UIImage?) {
        guard let checkImage = image else {return}
        _ = self.cacheImage.setObject(checkImage, forKey: key)
    }
        func downloadCachedImage(key: NSString) -> UIImage {
            
            guard let giveImage = self.cacheImage.object(forKey: key) else {return UIImage()}
            return giveImage
    }
}
