//
//  CustomAnnotation.swift
//  (1107)MapkitSample
//
//  Created by Samuel K on 2017. 11. 7..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import MapKit


class CustomAnnotation: NSObject, MKAnnotation  {

    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    init(title:String, subtitle:String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
    }
}
