//
//  ContentView.swift
//  Shared
//
//  Created by Micah Kimel on 5/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var globalObj: GlobalClass
    var body: some View {
        CustomNavView{
            VStack{
                RootCustomNavLink(destination: FirstView().customNavigationTitle("Custom View").customNavigationBarReturnButtonHidden(true), label: {
                    Text("Navigate View One").buttonStyleBlue()
                })
            }.customNavigationTitle("Home")
                .customNavigationBarBackButtonHidden(true)
                .customNavigationBarReturnButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
