//
//  MapView.swift
//  feroflytask
//
//  Created by Lalith on 04/04/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable{
    
    @ObservedObject var orderDataModel = OrderDataModel()
    
    func makeUIView(context: Context) -> MKMapView {
           MKMapView(frame: .zero)
       }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: orderDataModel.locationLatitude, longitude: orderDataModel.locationLongitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
