//
//  ProgressView.swift
//  feroflytask
//
//  Created by Lalith on 04/04/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    @State var f1: CGFloat = 35
    @State var f2: CGFloat = 17
    @State var f3: CGFloat = 17
    @State var f4: CGFloat = 17
    @State var f5: CGFloat = 17
    @State var t1: CGFloat = 0
    @State var t2: CGFloat = 0
    @State var t3: CGFloat = 0
    @State var t4: CGFloat = 0
    @State var i1: String = "flame.fill"
    @State var i2: String = "circle.fill"
    @State var i3: String = "circle.fill"
    @State var i4: String = "circle.fill"
    @State var i5: String = "circle.fill"
    @State var timeRemaining: Double = 0
    @State var t: CGFloat = 0;
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let maxValue: Double = 10
    var body: some View {
        VStack{
            GeometryReader { geometry in
                VStack{
                    HStack(spacing: 0){
                        Image(systemName: "flame.fill").foregroundColor(.gray).font(.system(size: self.f1))
                        ZStack(alignment: .leading){
                            Rectangle().frame(height: geometry.size.height).padding(0).foregroundColor(.gray)
                            Rectangle().frame(width: min(self.t1*geometry.size.width/29,geometry.size.width), height: geometry.size.height).foregroundColor(.red).animation(.default)
                            
                        }
                        Image(systemName: self.i2).foregroundColor(.gray).font(.system(size: self.f2))
                        ZStack(alignment: .leading){
                            Rectangle().frame(height: geometry.size.height).padding(0).foregroundColor(.gray)
                            Rectangle().frame(width: min(self.t2*geometry.size.width/27,geometry.size.width), height: geometry.size.height).foregroundColor(.red).animation(.default)
                            
                        }
                        Image(systemName: self.i3).foregroundColor(.gray).font(.system(size: self.f3))
                        ZStack(alignment: .leading){
                            Rectangle().frame(height: geometry.size.height).padding(0).foregroundColor(.gray)
                            Rectangle().frame(width: min(self.t3*geometry.size.width/29,geometry.size.width), height: geometry.size.height).foregroundColor(.red).animation(.default)
                            
                        }
                        Image(systemName: self.i4).foregroundColor(.gray).font(.system(size: self.f4))
                        ZStack(alignment: .leading){
                            Rectangle().frame(height: geometry.size.height).padding(0).foregroundColor(.gray)
                            Rectangle().frame(width: min(self.t4*geometry.size.width/29,geometry.size.width), height: geometry.size.height).foregroundColor(.red).animation(.default)
                            
                        }
                        Image(systemName: self.i5).foregroundColor(.gray).font(.system(size: self.f5))
                        
                    }
                    HStack{
                        Text("Cooking").font(.system(size: geometry.size.width*0.05))
                        Spacer()
                        Text("Picked").font(.system(size: 15))
                        Spacer()
                        Text("On the way").font(.system(size: 15))
                        Spacer()
                        Text("Delivered").font(.system(size: 15))
                        Spacer()
                        Text("Done").font(.system(size: 15))

                    }
                }
                
            }.frame(height: 6, alignment: .center).padding().onReceive(timer) { _ in
                self.timeRemaining += 1
                if(self.timeRemaining == 5){
                    self.f2 = 35;
                    self.i2 = "flame.fill"
                    self.t=0;
                }
                if(self.timeRemaining == 10){
                    self.f3 = 35;
                    self.i3 = "flame.fill"
                    self.t=0;
                }
                if(self.timeRemaining == 15){
                    self.f4 = 35;
                    self.i4 = "flame.fill"
                    self.t=0;
                }
                if(self.timeRemaining == 20){
                    self.f5 = 35;
                    self.i5 = "flame.fill"
                    self.t = 0;
                }
                if(self.timeRemaining<=5){
                    self.t1 += 1
                    
                }
                if(self.timeRemaining < 10 && self.timeRemaining > 5){
                    self.t2 += 1
                    
                }
                if(self.timeRemaining < 15 && self.timeRemaining > 10){
                    self.t3 += 1
                    
                }
                if(self.timeRemaining < 20 && self.timeRemaining > 15){
                    self.t4 += 1
                    
                }
                if(self.timeRemaining > 20){
                    self.timer.upstream.connect().cancel()
                }

            }  
        }
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
