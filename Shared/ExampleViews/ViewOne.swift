//
//  ViewOne.swift
//  CustomNavigation (iOS)
//
//  Created by Micah Kimel on 5/27/22.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        Text("Hello, View One!")
        CustomNavLink(destination: LastView().customNavigationTitle("Last View").customNavigationSubtitle("subtitle"), label: {
            Text("Go to Last View").buttonStyleGreen()
        })
    }
}

struct ViewOne_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
