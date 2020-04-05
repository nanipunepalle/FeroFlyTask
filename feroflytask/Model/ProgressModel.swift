//
//  ProgressModel.swift
//  feroflytask
//
//  Created by Lalith on 05/04/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation
import SwiftUI



//This class is for updating the font and color of progress bar

class ProgressModel: ObservableObject{
    
    //fonts of five icons in progress bar
    @Published var f1: CGFloat = 35
    @Published var f2: CGFloat = 17
    @Published var f3: CGFloat = 17
    @Published var f4: CGFloat = 17
    @Published var f5: CGFloat = 17
    
    //time of progress bar divided by icons
    @Published var t1: CGFloat = 0
    @Published var t2: CGFloat = 0
    @Published var t3: CGFloat = 0
    @Published var t4: CGFloat = 0
    
    //icons in progress bar
    @Published var i1: String = "flame.fill"
    @Published var i2: String = "circle.fill"
    @Published var i3: String = "circle.fill"
    @Published var i4: String = "circle.fill"
    @Published var i5: String = "circle.fill"
    
    //Colors for icon
    @Published var c1: String = "ButtonColor"
    @Published var c2: String = "SecondaryTextColor"
    @Published var c3: String = "SecondaryTextColor"
    @Published var c4: String = "SecondaryTextColor"
    @Published var c5: String = "SecondaryTextColor"
    
    
    
    //function for updating above properties based on time
    
    func performTask(timeOver: Double){
        if(timeOver == 5){
            self.f2 = 35;
            self.i2 = "flame.fill"
            self.c2 = "ButtonColor"
        }
        else if(timeOver == 10){
            self.f3 = 35;
            self.i3 = "flame.fill"
            self.c3 = "ButtonColor"
        }
        else if(timeOver == 15){
            self.f4 = 35;
            self.i4 = "flame.fill"
            self.c4 = "ButtonColor"
        }
        else if(timeOver == 20){
            self.f5 = 35;
            self.i5 = "flame.fill"
            self.c5 = "ButtonColor"
        }
        if(timeOver <= 5){
            self.t1 += 1
            
        }
        else if(timeOver < 10 && timeOver > 5){
            self.t2 += 1
            
        }
        else if(timeOver < 15 && timeOver > 10){
            self.t3 += 1
            
        }
        else if(timeOver < 20 && timeOver > 15){
            self.t4 += 1
            
        }
    }
}
