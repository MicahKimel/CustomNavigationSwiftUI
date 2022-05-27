//
//  CustomerNavLink.swift
//  PhoridFly
//
//  Created by Micah Kimel on 4/6/22.
//

import SwiftUI

struct CustomNavLink<Label:View, Destination:View>: View {
    let destination: Destination
    let label: Label
    @State var isactive: Bool = false
    //@EnvironmentObject private var globalObj: GlobalClass
    
    init(destination: Destination, @ViewBuilder label: () -> Label){
        self.destination = destination
        self.label = label()
    }
    var body: some View {
        NavigationLink(
            destination:
                CustomNavBarContainerView(content: {
                    destination
                })
                .navigationBarHidden(true),
            label:{
              label
            })
        .isDetailLink(false)
    }
}

// use this view on the home view so you can pop to root
struct RootCustomNavLink<Label:View, Destination:View>: View {
    let destination: Destination
    let label: Label
    @State var isactive: Bool = false
    @EnvironmentObject private var globalObj: GlobalClass

    init(destination: Destination, @ViewBuilder label: () -> Label){
        self.destination = destination
        self.label = label()
    }
    var body: some View {
        NavigationLink(
             destination:
                CustomNavBarContainerView(content: {
                    destination
                })
                .navigationBarHidden(true),
            isActive: $globalObj.isActive){
              label
            }
        .isDetailLink(false)
    }
}

//use this view to trigger a nagivation from a sheet view
struct CustomNavLinkTrigger<Label:View, Destination:View>: View {
    let destination: Destination
    let label: Label
    @Binding var isactive: Bool
    @EnvironmentObject private var globalObj: GlobalClass

    init(destination: Destination, isActive: Binding<Bool>, @ViewBuilder label: () -> Label){
        self.destination = destination
        self.label = label()
        self._isactive = isActive
    }
    var body: some View {
        NavigationLink(
             destination:
                CustomNavBarContainerView(content: {
                    destination
                })
                .navigationBarHidden(true),
            isActive: $isactive){
              label
            }
        .isDetailLink(false)
    }
}

struct CustomerNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavLink(destination: Text("Destination")){
            Text("Navigate")
        }
    }
}
