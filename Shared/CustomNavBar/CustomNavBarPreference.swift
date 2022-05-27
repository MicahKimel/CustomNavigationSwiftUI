//
//  CustomNavBarPreference.swift
//  PhoridFly
//
//  Created by Micah Kimel on 4/6/22.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey{
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String){
        value = nextValue()
    }
}

struct CustomNavBarSubtitlePreferenceKey: PreferenceKey{
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?){
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey{
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool){
        value = nextValue()
    }
}

struct CustomNavBarReturnButtonHiddenPreferenceKey: PreferenceKey{
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool){
        value = nextValue()
    }
}

extension View {
    func customNavigationTitle(_ title: String) -> some View{
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    func customNavigationSubtitle(_ subtitle: String?) -> some View{
        preference(key: CustomNavBarSubtitlePreferenceKey.self, value: subtitle)
    }
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View{
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    func customNavigationBarReturnButtonHidden(_ hidden: Bool) -> some View{
        preference(key: CustomNavBarReturnButtonHiddenPreferenceKey.self, value: hidden)
    }
    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false, returnButtonHidden: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
            .customNavigationBarReturnButtonHidden(returnButtonHidden)
    }
}
