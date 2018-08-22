//
//  Geo.swift
//  testing
//
//  Created by Mohammed Alsafi on 13/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Geo: Object, JSONable {
    @objc dynamic var lat: String = ""
    @objc dynamic var lng: String = ""

    convenience required init?(parameter: JSON) {
        self.init()
        self.lat = parameter["lat"].stringValue
        self.lng = parameter["lng"].stringValue
        
    }
}
