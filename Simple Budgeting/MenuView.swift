//
//  MenuView.swift
//  Simple Budgeting
//
//  Created by Miguel Rodriguez on 1/3/21.
//

import SwiftUI

struct MenuView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Quicksand-Bold", size: 20)!]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    VStack {
                        NavigationLink(
                            destination: QuickInfoView()) {
                            Text("Quick Info")
                        }
                        Text("Total: $0.00")
                            .fontWeight(.bold)
                            .padding(.vertical)
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 50)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(15)
                    .clipped()
                    .shadow(color: Color(UIColor.systemGray2), radius: 10)
                    .padding(30)
                }
            }.padding(.horizontal, 20)
            .navigationBarTitle(Text("Simple Budgeting").font(.subheadline), displayMode: .large)
            //.font(.custom("Quicksand-Regular", size: 20))
        }.font(.custom("Quicksand-Regular", size: 20))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
