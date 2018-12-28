//
//  Movie.swift
//  SearchBar
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    var title:String
    var img:UIImage = UIImage()
    
    init(title:String, img:UIImage) {
        self.title = title
        self.img = img
    }
    
    
}
