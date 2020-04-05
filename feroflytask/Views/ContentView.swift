//
//  ContentView.swift
//  feroflytask
//
//  Created by Lalith on 04/04/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var orderDataModel = OrderDataModel()
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                ScrollView{
                    VStack{
                        TopView(quantity: self.orderDataModel.quantity)
                        OrderInfoView(orderId: self.orderDataModel.orderID, orderDate: self.orderDataModel.orderDate, paymentMode: self.orderDataModel.paymentMode)
                        AddressView(addressType: self.orderDataModel.addressType, address: self.orderDataModel.address, instructions: self.orderDataModel.instruction)
                        Divider()
                        ProgressView().frame( height: 45)
                        BottomView()
                        ReportIssueButtonView()
                    }.padding()
                }
            }.navigationBarTitle(Text("Order Details"),displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone Xr")
    }
}



//TopView that contains images and items ordered details.

struct TopView: View {
    @State var screenWidth: CGFloat = 0
    @State var quantity: Int
    var body: some View {
        HStack(spacing: 5){
            Image("food").resizable()
                .frame(width: 80, height: 80, alignment: .leading)
                .padding(.leading).padding(.top)
            Image("food").resizable()
                .frame(width: 80, height: 80, alignment: .leading)
                .padding(.top)
            VStack(alignment: .leading,spacing: 2){
                Text("\(quantity) items ordered").font(Font.custom("Calibri Regular", size: screenWidth*0.045 ))
                Button(action: {}) {
                    Text("See Details")
                    Image(systemName: "chevron.right")
                }.foregroundColor(Color("SecondaryTextColor"))
            }
            Spacer()
        }.onAppear {
                self.screenWidth = UIScreen.main.bounds.width
        }
    }
}


//This view contains entire address view

struct AddressView: View {
    @State var addressType: String
    @State var address: String
    @State var instructions: String
    
    @State var screenWidth: CGFloat = 0
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Image(systemName: "location.fill")
                    .foregroundColor(Color("ButtonColor"))
                    .font(.system(size: 40)).padding(.top).offset(x: 0, y: 10)
                VStack(alignment: .leading){
                    Text("\(addressType)").bold().padding(.bottom).padding(.top)
                    Text("\(address)")
                        .padding(.bottom).font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                        .fixedSize(horizontal: false, vertical: true)
                    Text(instructions).font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                }
                Spacer()
            }.padding()
        }.onAppear {
                self.screenWidth = UIScreen.main.bounds.width
        }
    }
}

//Order info View

struct OrderInfoView: View {
    @State var orderId: String
    @State var orderDate: String
    @State var paymentMode: String
    
    @State var screenWidth: CGFloat = 0
    var body: some View {
        
        VStack{
            VStack{
                Divider()
                HStack{
                    Text("Orderid ").font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                    Spacer()
                    Text("\(orderId)").font(Font.custom("Calibri Regular", size: screenWidth*0.035 ))

                }.padding(.leading).padding(.trailing)
                Divider()
                HStack{
                    Text("OrderDate").font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                    Spacer()
                    Text("\(orderDate)").font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                }.padding(.leading).padding(.trailing)
                Divider()
                HStack{
                    Text("Payment Mode").font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                    Spacer()
                    Text("\(paymentMode)").font(Font.custom("Calibri Regular", size: screenWidth*0.04 ))
                }.padding(.leading).padding(.trailing)
                Divider()
            }
        }.onAppear {
                self.screenWidth = UIScreen.main.bounds.width
        }
    }
}

//This view contains report isuue button

struct ReportIssueButtonView: View {
    @State var screenWidth: CGFloat = 0
    var body: some View {
        Button(action: {}) {
            Text("Report issue")
        }.padding()
            .frame(width: screenWidth - 40, height: 40, alignment: .center)
            .background(Color("ButtonColor"))
            .foregroundColor(.white)
            .cornerRadius(30)
            .disabled(true).onAppear {
                self.screenWidth = UIScreen.main.bounds.width
        }
    }
}

//This view contains Track button and order status
struct BottomView: View {
    
    @State var selection: Int? = nil
    @State var screenWidth: CGFloat = 0
    var body: some View {
        VStack{
            HStack {
                VStack(alignment:.leading ) {
                    Text("Preparing Dinner").font(Font.custom("Calibri Regular", size: screenWidth*0.05 ))
                    HStack{
                        Text("Expected arrival time:")
                            .foregroundColor(Color("SecondaryTextColor")).font(Font.custom("Calibri Regular", size: screenWidth*0.05 ))
                        Text("09:51PM").font(Font.custom("Calibri Regular", size: screenWidth*0.05 ))
                        Spacer()
                        
                    }
                    
                }
                Spacer()
            }.padding()
            HStack(){
                NavigationLink(destination: MapView(), tag: 1, selection: $selection) {
                    Button(action: {
                        self.selection = 1
                    }) {
                        Image(systemName: "location.fill").foregroundColor(Color("ButtonColor"))
                        Text("Track order")
                    }
                    .frame(width: screenWidth-250, height: 40, alignment: .center)
                    .background(Color("TrackButtonColor"))
                    .foregroundColor(Color("SecondaryTextColor"))
                }
                Spacer()
            }.padding().onAppear {
                    self.screenWidth = UIScreen.main.bounds.width
            }
        }.padding(.top)
    }
}





//                        VStack{
//                            Divider()
//                            HStack{
//                                Text("Orderid ").font(Font.custom("Calibri Regular", size: geo.size.width*0.04 ))
//                                    .foregroundColor(Color("SecondaryTextColor"))
//                                Spacer()
//                                Text("ORDERNUMBER4867392208600039").font(Font.custom("Calibri Regular", size: geo.size.width*0.035 ))
//
//                            }.padding(.leading).padding(.trailing)
//                            Divider()
//                            HStack{
//                                Text("OrderDate")
//                                    .font(Font.custom("Calibri Regular", size: geo.size.width*0.04 ))
//                                    .foregroundColor(Color("SecondaryTextColor"))
//                                Spacer()
//                                Text("Oct 23,2019 9:08PM").font(Font.custom("Calibri Regular", size: geo.size.width*0.04 ))
//                            }.padding(.leading).padding(.trailing)
//                            Divider()
//                            HStack{
//                                Text("Payment Mode")
//                                    .font(Font.custom("Calibri Regular", size: geo.size.width*0.04 ))
//                                    .foregroundColor(Color("SecondaryTextColor"))
//                                Spacer()
//                                Text("PHONEPE").font(Font.custom("Calibri Regular", size: geo.size.width*0.04 ))
//                            }.padding(.leading).padding(.trailing)
//                            Divider()
//                        }
