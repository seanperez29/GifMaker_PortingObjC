//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Sean Perez on 10/15/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    let url: URL
    let videoURL: URL
    let caption: String?
    let gifImage: UIImage?
    var gifData: NSData?
    
    init(url: URL, videoURL: URL, caption: String?) {
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gifWithURL(url.absoluteString)
        self.gifData = nil
    }
    
//    init(name: String) {
//        self.gifImage = UIImage.gifWithName(name)
//    }
}
