//
//  ContentView.swift
//  Simple Budgeting
//
//  Created by Miguel Rodriguez on 1/2/21.
//

import SwiftUI

struct QuickInfoView: View {
    
    @State var monthlyPay: String = ""
    @State var mortgage: String = ""
    @State var carPay: String = ""
    @State var carInsurance: String = ""
    
    @State private var keyboardHeight: CGFloat = 0
    
    // Adjust view to keyboard observer
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Quicksand-Bold", size: 30)!]
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                Group {
                    /*Text("Quick Info")
                    .font(.title)
                    .fontWeight(.bold)*/
                    Spacer()
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(Circle())
                        .clipped()
                        .shadow(color: Color(UIColor.systemGray2), radius: 15)
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Text("Enter your monthly information.")
                    }
                    Text("Total: \(getTotal(totalPay: monthlyPay, mrtg: mortgage, crPy: carPay, crIn: carInsurance))")
                        //.font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .font(.custom("Quicksand-Regular", size: 25))
                }
                Group {
                    HStack {
                        Text("Monthly Pay: ")
                        Spacer()
                    }
                    HStack {
                        Text("$: ")
                        TextField("Enter your monthly pay", text: $monthlyPay)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button("Done") {
                            UIApplication.shared.endEditing()
                        }
                        .padding(5)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(7.0)
                    }.padding(.bottom, 20)
                    HStack {
                        Text("Mortgage: ")
                        Spacer()
                    }
                    HStack {
                        Text("$: ")
                        TextField("Enter your mortgage amount", text: $mortgage)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button("Done") {
                            UIApplication.shared.endEditing()
                        }
                        .padding(5)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(7.0)
                    }.padding(.bottom, 20)
                    HStack {
                        Text("Car Payment: ")
                        Spacer()
                    }
                    HStack {
                        Text("$: ")
                        TextField("Enter your car payment", text: $carPay)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button("Done") {
                            UIApplication.shared.endEditing()
                        }
                        .padding(5)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(7.0)
                    }.padding(.bottom, 20)
                    HStack {
                        Text("Car Insurance:")
                        Spacer()
                    }
                    HStack {
                        Text("$: ")
                        TextField("Enter Car Insurance", text: $carInsurance)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        Button("Done") {
                            UIApplication.shared.endEditing()
                        }
                        .padding(5)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(7.0)
                    }.padding(.bottom, 20)
                }
                Button("Clear") {
                    monthlyPay = ""
                    mortgage = ""
                    carPay = ""
                    carInsurance = ""
                }
                .padding(5)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(7.0)
            }
            .font(.custom("Quicksand-Regular", size: 20))
            .font(.system(size: 20))
            .padding(.horizontal, 10)
        }
        .navigationBarTitle(Text("Quick Info").font(.subheadline), displayMode: .large)
        //.padding(.top, 88)
        //.background(Color(UIColor.systemGray6))
        //.edgesIgnoringSafeArea(.bottom)
        //.ignoresSafeArea()
        .offset(y: -keyboardResponder.currentHeight * 0.001) //shift view with keyboard
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuickInfoView()
        }
    }
}

// get total of money left
func getTotal(totalPay: String, mrtg: String, crPy: String, crIn: String) -> String {
    let totalPayFlt: Float
    let mrtgFlt: Float
    let crPayFlt: Float
    let crInFlt: Float
    
    // use number formatter for pretty number format
    let currencyFormat = NumberFormatter()
    currencyFormat.numberStyle = .currency
    currencyFormat.locale = Locale(identifier: "en_US")
    
    if totalPay == "" {
        totalPayFlt = 0
    } else {
        totalPayFlt = Float(totalPay)!
    }
    
    if mrtg == "" {
        mrtgFlt = 0
    } else {
        mrtgFlt = Float(mrtg)!
    }
    
    if crPy == "" {
        crPayFlt = 0
    } else {
        crPayFlt = Float(crPy)!
    }
    
    if crIn == "" {
        crInFlt = 0
    } else {
        crInFlt = Float(crIn)!
    }
    
    let totalFlt = totalPayFlt - mrtgFlt - crPayFlt - crInFlt
    
    return  currencyFormat.string(from: NSNumber(value: totalFlt))!
}
