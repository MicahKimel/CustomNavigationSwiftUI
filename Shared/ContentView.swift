//
//  ContentView.swift
//  Shared
//
//  Created by Micah Kimel on 5/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavLink(destination: ViewOne(), label: {
            Text("Navigate View One")
        }).customNavigationTitle("Custom Nav Bar").customNavigationSubtitle("Custom Subtitle")//hide back button .customNavigationBarBackButtonHidden(true)
        //hide rooot back button .customNavigationBarRootButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
