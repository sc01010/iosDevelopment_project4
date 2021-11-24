//
//  Person.swift
//  sc2796_p5
//
//  Created by Steven Chen on 10/28/21.
//

import Foundation
import UIKit

class Person {
    var name: String
    var title: String
    var image: UIImage!
    var department: String
    var isHidden: Bool
    
    init (name: String, title: String, image: UIImage, department: String) {
        self.name = name
        self.title = title
        self.image = image
        self.department = department
        self.isHidden = false
    }
    
}
