//
//  NextView1.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2021/1/4.
//

import SwiftUI

struct NextView1: View {
    var body: some View {
        NavigationLink(destination: NextView2()) {
            Text("NavigationButton").bold()
                .foregroundColor(.orange)
                .font(.largeTitle)
            }
    }
}

struct NextView1_Previews: PreviewProvider {
    static var previews: some View {
        NextView1()
    }
}
