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
            RootCustomNavLink(destination: FirstView().customNavigationTitle("Custom View"), label: {
                Text("Navigate View One").buttonStyleBlue()
            })
        }
        .customNavigationBarBackButtonHidden(true)
        .customNavigationBarReturnButtonHidden(true)
        .customNavigationTitle("Home Page")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
