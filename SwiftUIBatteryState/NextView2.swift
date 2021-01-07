//
//  NextView2.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2021/1/4.
//

import SwiftUI

struct NextView2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationLink(destination: NextView()) {
            Text("NavigationButton").bold()
                .foregroundColor(.orange)
                .font(.largeTitle)
            }
    }
}

struct NextView2_Previews: PreviewProvider {
    static var previews: some View {
        NextView2()
    }
}
