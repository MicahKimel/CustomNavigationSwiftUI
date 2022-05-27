//
//  CustomNavBarView.swift
//  PhoridFly
//
//  Created by Micah Kimel on 4/6/22.
//

import SwiftUI

struct CustomNavBarView: View {
    let showBackButton: Bool
    let showReturnButton: Bool
    let title: String
    let subtitle: String?
    @EnvironmentObject private var globalObj: GlobalClass
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack{
                Spacer()
                HStack {
                    if !showBackButton{
                        backButton
                    } else {
                        RootBack.opacity(0)
                    }
                    Spacer()
                        titleSection
                    Spacer()
                    if !showReturnButton{
                        RootBack
                    } else {
                        backButton.opacity(0)
                    }
                }
                .padding()
                .accentColor(.green)
                .font(.headline)
                .background(
                    Color.white.ignoresSafeArea(edges: .top)
                )
            }
            .frame(height: 110)
        }
    private var backButton: some View {
        Button(action:{
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left").padding()
        })
    }
    
    private var RootBack: some View{
        Button(action:{
            globalObj.isActive = false
        }, label: {
            Image(systemName: "xmark").foregroundColor(Color.blue).padding()
        })
    }
    
    private var titleSection: some View{
        VStack(spacing: 4){
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}



struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomNavBarView(showBackButton: false, showReturnButton: false, title: "Title", subtitle: "Subtitle")
            Spacer()
        }
    }
}

extension UINavigationController{
    open override func viewDidLoad(){
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

