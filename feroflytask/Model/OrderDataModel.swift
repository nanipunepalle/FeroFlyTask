//
//  OrderDataModel.swift
//  feroflytask
//
//  Created by Lalith on 05/04/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation
import MapKit

class OrderDataModel: ObservableObject{
    @Published var quantity: Int = 2
    @Published var orderID: String = "ORDERNUMBER4867392208600039"
    @Published var orderDate: String = "Oct 23,2019 9:08 PM"
    @Published var paymentMode: String = "PHONEPE"
    @Published var addressType: String = "OFFICE"
    @Published var address: String = "2nd floor,Hno 12,Back side of MGS Hospital,West Punjabi,Delhi,11206,India"
    @Published var instruction: String = "Instruction: Call on arrival,bring cutlery"
    @Published var locationLatitude: CLLocationDegrees = 28.569130
    @Published var locationLongitude: CLLocationDegrees = 77.198059
}
