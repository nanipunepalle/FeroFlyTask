//
//  ProgressView.swift
//  feroflytask
//
//  Created by Lalith on 04/04/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    
    
    @State var timeOver: Double = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ObservedObject var progressModel = ProgressModel()
    var body: some View {
        VStack{
            GeometryReader { geometry in
                VStack{
                    HStack(spacing: 0){
                        Image(systemName: "flame.fill")
                            .foregroundColor(Color(self.progressModel.c1))
                            .font(.system(size: self.progressModel.f1))
                        ZStack(alignment: .leading){
                            Rectangle()
                                .frame(height: geometry.size.height)
                                .foregroundColor(Color("SecondaryTextColor"))
                            Rectangle()
                                .frame(width: self.progressModel.t1*geometry.size.width/29, height: geometry.size.height)
                                .foregroundColor(Color("ButtonColor")).animation(.default)
                            
                        }
                        
                        Image(systemName: self.progressModel.i2)
                            .foregroundColor(Color(self.progressModel.c2))
                            .font(.system(size: self.progressModel.f2))
                        ZStack(alignment: .leading){
                            Rectangle()
                                .frame(height: geometry.size.height)
                                .foregroundColor(Color("SecondaryTextColor"))
                            Rectangle()
                                .frame(width: self.progressModel.t2*geometry.size.width/27, height: geometry.size.height)
                                .foregroundColor(Color("ButtonColor")).animation(.default)
                            
                        }
                        
                        
                        Image(systemName: self.progressModel.i3)
                            .foregroundColor(Color(self.progressModel.c3))
                            .font(.system(size: self.progressModel.f3))
                        ZStack(alignment: .leading){
                            Rectangle()
                                .frame(height: geometry.size.height)
                                .foregroundColor(Color("SecondaryTextColor"))
                            Rectangle()
                                .frame(width: self.progressModel.t3*geometry.size.width/29, height: geometry.size.height)
                                .foregroundColor(Color("ButtonColor")).animation(.default)
                            
                        }
                        
                        
                        Image(systemName: self.progressModel.i4)
                            .foregroundColor(Color(self.progressModel.c4))
                            .font(.system(size: self.progressModel.f4))
                        ZStack(alignment: .leading){
                            Rectangle()
                                .frame(height: geometry.size.height)
                                .foregroundColor(Color("SecondaryTextColor"))
                            Rectangle()
                                .frame(width: self.progressModel.t4*geometry.size.width/29, height: geometry.size.height)
                                .foregroundColor(Color("ButtonColor")).animation(.default)
                            
                        }
                        Image(systemName: self.progressModel.i5)
                            .foregroundColor(Color(self.progressModel.c5))
                            .font(.system(size: self.progressModel.f5))
                        
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
                self.timeOver += 1
                self.progressModel.performTask(timeOver: self.timeOver)
                
                if(self.timeOver == 20){
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
