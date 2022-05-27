//
//  CustomNavView.swift
//  PhoridFly
//
//  Created by Micah Kimel on 4/6/22.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    var body: some View {
        NavigationView{
            CustomNavBarContainerView{
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView{
            Color.white.ignoresSafeArea()
        }
    }
}
