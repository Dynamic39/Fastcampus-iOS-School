//
//  ViewController.swift
//  (1107)MapkitSample
//
//  Created by Samuel K on 2017. 11. 7..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let location = CLLocationCoordinate2D(latitude: 37.517556, longitude: 127.018112)
        let location2 = CLLocationCoordinate2D(latitude: 37.517558, longitude: 127.018120)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: location, span: span)
        let region2 = MKCoordinateRegion(center: location2, span: span)
        mapView.setRegion(region, animated: false)
        mapView.setRegion(region2, animated: false)
        
        let customPin = CustomAnnotation(title: "Sample", subtitle: "Testing..", coordinate: location)
        
        let customPin2 = CustomAnnotation(title: "Sample2", subtitle: "Testing..2", coordinate: location2)
        
        mapView.addAnnotation(customPin)
        mapView.addAnnotation(customPin2)
        
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? CustomAnnotation {
            let identity = "pin"
            var pinView : MKPinAnnotationView
            if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identity) as? MKPinAnnotationView {
                dequeueView.annotation = annotation
                pinView = dequeueView
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
                pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return pinView
            
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        
        
    }
    
 
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

