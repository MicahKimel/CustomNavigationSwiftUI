//
//  CustomNavBarContainerView.swift
//  CustomNavigation (iOS)
//
//  Created by Micah Kimel on 5/27/22.
//

import Foundation
import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    @State private var showBackButton: Bool = false
    @State private var showReturnButton: Bool = false
    @State private var title: String = "Title"
    @State private var subtitle: String? = "Subtitle"
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0){
            CustomNavBarView(showBackButton: showBackButton, showReturnButton: showReturnButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self,perform: {
            value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self,perform: {
            value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self,perform: {
            value in
            self.showBackButton = value
        })
        .onPreferenceChange(CustomNavBarReturnButtonHiddenPreferenceKey.self,perform: {
            value in
            self.showReturnButton = value
        })
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView{
            ZStack{
                Color.green.ignoresSafeArea()
                
                Text("Hello, world!")
                    .foregroundColor(.white)
            }
        }
        .customNavigationTitle("Title")
        .customNavigationBarBackButtonHidden(true)
        .customNavigationBarReturnButtonHidden(true)
    }
}
