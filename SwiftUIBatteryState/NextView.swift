//
//  NextView.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2021/1/4.
//

import SwiftUI

struct NextView: View {
    
    init() {

         UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
         UINavigationBar.appearance().shadowImage = UIImage()
//         UINavigationBar.appearance().isTranslucent = true
//         UINavigationBar.appearance().tintColor = .clear
         UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        ZStack {
            Image("bg")
                //.edgesIgnoringSafeArea(.all)
                .scaledToFit()
                .padding(.trailing,0)
            
            NavigationLink(destination: NextView1()) {
                Text("NavigationButton").bold()
                    .foregroundColor(.orange)
                    .font(.largeTitle)
                }
        }

    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
