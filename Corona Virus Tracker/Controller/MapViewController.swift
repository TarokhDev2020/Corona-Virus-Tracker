//
//  MapViewController.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet var mapView: MKMapView!
    
    
    //MARK: - Variables
    var locationManager = CLLocationManager()
    let request = MKLocalSearch.Request()
    let whoURL = "https://www.who.int/"
    
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0x151515)
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .dark
        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.title = "Hospitals"
        let whoBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "staroflife"), style: .plain, target: self, action: #selector(who))
        whoBarButtonItem.tintColor = .white
        tabBarController?.navigationItem.rightBarButtonItem = whoBarButtonItem
    }
    
    //MARK: - Functions
    @objc private func who() {
        self.performSegue(withIdentifier: "mapsToURL", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapsToURL" {
            if let webVC = segue.destination as? WebViewController {
                webVC.url = whoURL
            }
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            request.naturalLanguageQuery = "Hospital"
            request.region = region
            
            let search = MKLocalSearch(request: request)
            search.start { response, error in
                guard let response = response else {
                    print("There was an error searching for: \(self.request.naturalLanguageQuery!) error: \(error!)")
                    return
                }
                
                for mapItem in response.mapItems {
                    // Display the received items
                    let latitude = mapItem.placemark.location!.coordinate.latitude
                    let longitude = mapItem.placemark.location!.coordinate.longitude
                    
                    let hospital = MKPointAnnotation()
                    hospital.title = mapItem.name!
                    hospital.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    self.mapView.addAnnotation(hospital)
                }
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
    
}
