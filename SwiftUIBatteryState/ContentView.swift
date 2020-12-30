//
//  ContentView.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    
    var batteryState = "未知"
    
    init() {
        
        UIDevice.current.isBatteryMonitoringEnabled = true;
        
        print("当前电量0是："+String(UIDevice.current.batteryLevel))
        
        print("当前充电状态："+String(UIDevice.current.batteryState.rawValue))
        
        if UIDevice.current.batteryState.rawValue == UIDevice.BatteryState.unknown.rawValue {
            //未知
            batteryState = "未知"
        }else if  UIDevice.current.batteryState.rawValue == UIDevice.BatteryState.unplugged.rawValue{
            //放电
            batteryState = "放电"
        }else if  UIDevice.current.batteryState.rawValue == UIDevice.BatteryState.charging.rawValue{
            //充电
            batteryState = "充电"
        }else if  UIDevice.current.batteryState.rawValue == UIDevice.BatteryState.full.rawValue{
            //充满
            batteryState = "充满"
        }

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
        Text(batteryState)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
