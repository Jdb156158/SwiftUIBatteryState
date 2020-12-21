//
//  ContentView.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    init() {
        
        UIDevice.current.isBatteryMonitoringEnabled = true;
        
        print("当前电量0是："+String(UIDevice.current.batteryLevel))

        NotificationCenter.default.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: nil) { (Notification) in
            print("11111111111")
            print("当前电量1是："+String(UIDevice.current.batteryLevel))
        }
        
        NotificationCenter.default.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: nil) { (Notification) in
            print("222222222222")
            print("当前电量2是："+String(UIDevice.current.batteryLevel))
        }
        
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
