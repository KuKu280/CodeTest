//
//  DashBoardViewController.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation
import UIKit
import MapKit
import CoreLocation
import RealmSwift

class DashBoardViewController: UIViewController {
    
    // MARK: Delegate initialization
    var presenter: DashBoardViewToPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var notiView: UIView!
    @IBOutlet weak var navigateView: UIView!
    
    // MARK: Custom initializers go here
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionInMeters: Double = 500
 
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: User Interaction - Actions & Targets
    
    @IBAction func goSearchViewAction(_ sender: UIButton) {
        presenter?.clickedGoButton()
    }
    
    // MARK: Additional Helpers
    fileprivate func setupUI() {
        bgView.dropShadow()
        notiView.circelDropShadow()
        navigateView.circelDropShadow()
        goBtn.clipsToBounds = true
        goBtn.layer.cornerRadius = 10
        goBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        navigateView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        centerViewOnUserLocation()
    }
    
}

// MARK: - Extension
/**
 - Documentation for purpose of extension
 */
extension DashBoardViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return  }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

// MARK: - Presenter to View
extension DashBoardViewController: DashBoardPresenterToViewProtocl {
    
    func initialControlSetup() {
        setupUI()
        checkLocationServices()
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
          
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    
}
