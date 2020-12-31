//
//  ContentView.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/21.
//

import SwiftUI

class Model: ObservableObject {
    
    @Published var batteryLevel: Float = 0.00
    @Published var batteryState: String = "未知"
    @Published var batteryContainer: String = "未知"
    @Published var batteryPower: String = "未知"
    
    init() {

        let helper:batteryService =  batteryService()
        helper.batteryStateResults = {(newbatteryState)  in
            //刷新你的ui
            print(newbatteryState)
            self.batteryState = newbatteryState
        }

        helper.batteryLevelResults = { (leve) in
            //刷新你的ui
            print(leve)
            self.batteryLevel = leve
        }
        
        helper.batteryContainerResults = { (container) in
            print(container)
            self.batteryContainer = container
        }
        
        helper.batteryPowerResults = { (power) in
            print(power)
            self.batteryPower = power
        }

    }
    
}


struct ContentView: View {

    @ObservedObject var model = Model()
    
    var body: some View {
        VStack {
            RingView()
            Text("batteryState: \(model.batteryState)")
            Text("batteryLevel: \(model.batteryLevel)")
            Text("batteryContainer: \(model.batteryContainer)")
            Text("batteryPower: \(model.batteryPower)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
