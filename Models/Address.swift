//
//  File.swift
//  testing
//
//  Created by Mohammed Alsafi on 06/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Address: Object, JSONable {
    
    @objc dynamic var city: String = ""
    @objc dynamic var district: String = ""
    @objc dynamic var street: String = ""
    @objc dynamic var geo: Geo? = Geo()

    

    convenience required init (parameter: JSON) {
        self.init()
        self.city = parameter["street"].stringValue
        self.district = parameter["suite"].stringValue
        self.city = parameter["city"].stringValue
        self.geo = parameter["zipcode"].to(type: Geo.self) as? Geo
        
    }
}
    
    
    
