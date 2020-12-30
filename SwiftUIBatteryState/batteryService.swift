//
//  batteryService.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/30.
//

import UIKit

class batteryService: NSObject {
    
    
    /// 返回数据回调（闭包 如oc中的block）
    public var batteryLevelResults: ((Float)->())?
    public var batteryStateResults: ((String)->())?
        
    override init() {
        
        super.init()
        
        UIDevice.current.isBatteryMonitoringEnabled = true;
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            if self.batteryLevelResults != nil {
                self.batteryLevelResults!(UIDevice.current.batteryLevel)
            }

            if self.batteryStateResults != nil {
                self.batteryStateResults!(self.getNewBatteryState())
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIDevice.batteryLevelDidChangeNotification, object: nil, queue: nil) { (Notification)  in
            if (self.batteryLevelResults != nil) {
                self.batteryLevelResults!(UIDevice.current.batteryLevel)
            }
        }

        NotificationCenter.default.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: nil) { (Notification) in
            if self.batteryStateResults != nil {
                self.batteryStateResults!(self.getNewBatteryState())
            }
        }
        
    }
    
    @objc func getNewBatteryState() -> String {
        
        var batteryState =  "未知";
        
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
        return batteryState
    }
    
}
