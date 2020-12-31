//
//  batteryService.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/30.
//

import UIKit

class batteryService: NSObject {
    
    
    /// 返回数据回调（闭包 如oc中的block）
    //电池电量
    public var batteryLevelResults: ((Float)->())?
    //电池状态
    public var batteryStateResults: ((String)->())?
    //电池容量
    public var batteryContainerResults: ((String)->())?
    //充电功率
    public var batteryPowerResults: ((String)->())?
        
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
            
            if self.batteryContainerResults != nil {
                
                let batteryContainer = String(format: "%d mAh",self.BatteryCapacityContainer())

                self.batteryContainerResults!(batteryContainer)
            }
            
            if self.batteryPowerResults != nil {
                
                let batteryPower = String(format: "%d W",5)

                self.batteryPowerResults!(batteryPower)
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
    
    func getNewBatteryState() -> String {
        
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
    
    //各个机型的手机出厂设计电池容量
    func BatteryCapacityContainer () ->Int {
        
        let identifier = self.transformMachineToIdevice()
        
        switch identifier {
        case "iPhone1,1":                                 return 1400
        case "iPhone1,2":                                 return 1150
        case "iPhone2,1":                                 return 1219
        case "iPhone3,1":                                 return 1420
        case "iPhone3,3":                                 return 1420
        case "iPhone4,1":                                 return 1430//DiviceType.iPhone_4S
        case "iPhone5,1":                                 return 1440//DiviceType.iPhone_5_GSM
        case "iPhone5,2":                                 return 1440//DiviceType.iPhone_5_CDMA
        case "iPhone5,3":                                 return 1507//DiviceType.iPhone_5C_GSM
        case "iPhone5,4":                                 return 1570//DiviceType.iPhone_5C_GSM_CDMA
        case "iPhone6,1":                                 return 1570//DiviceType.iPhone_5S_GSM
        case "iPhone6,2":                                 return 1570//DiviceType.iPhone_5S_GSM_CDMA
        case "iPhone7,1":                                 return 2915//DiviceType.iPhone_6_Plus
        case "iPhone7,2":                                 return 1810//DiviceType.iPhone_6
        case "iPhone8,1":                                 return 1715//DiviceType.iPhone_6S
        case "iPhone8,2":                                 return 2750//DiviceType.iPhone_6S_Plus
        case "iPhone8,4":                                 return 1624//DiviceType.iPhone_SE
        // 日行两款手机型号均为日本独占
        case "iPhone9,1":                                 return 1960//DiviceType.Chinese_iPhone_7
        case "iPhone9,2":                                 return 2900//DiviceType.Chinese_iPhone_7_Plus
        case "iPhone9,3":                                 return 1960//DiviceType.American_iPhone_7
        case "iPhone9,4":                                 return 2900//DiviceType.American_iPhone_7_Plus
        case "iPhone10,1":                                 return 1821//DiviceType.Chinese_iPhone_8
        case "iPhone10,4":                                 return 1821//DiviceType.Global_iPhone_8
        case "iPhone10,2":                                 return 2691//DiviceType.Chinese_iPhone_8_Plus
        case "iPhone10,5":                                 return 2691//DiviceType.Global_iPhone_8_Plus
        case "iPhone10,3":                                 return 2716//DiviceType.Chinese_iPhone_X
        case "iPhone10,6":                                 return 2716//DiviceType.Global_iPhone_X
        case "iPhone11,2":                                 return 2658//DiviceType.iPhone_XS
        case "iPhone11,4":                                 return 3174//DiviceType.iPhone_XS_Max
        case "iPhone11,6":                                 return 3174//DiviceType.iPhone_XS_Max
        case "iPhone11,8":                                 return 2942//DiviceType.iPhone_XR
        case "iPhone12,1":                                 return 3110//DiviceType.iPhone_11
        case "iPhone12,3":                                 return 3190//DiviceType.iPhone_pro
        case "iPhone12,5":                                 return 3500//DiviceType.iPhone_pro_Max
        case "iPhone12,8":                                 return 1821//DiviceType.iPhone_SE(2nd generation)
        case "iPhone13,1":                                 return 2227//DiviceType.iPhone_12_mini
        case "iPhone13,2":                                 return 2851//DiviceType.iPhone_12
        case "iPhone13,3":                                 return 2815//DiviceType.iPhone_12_pro
        case "iPhone13,4":                                 return 3687//DiviceType.iPhone_12_pro_Max
            
        case "iPod1,1":                                 return 789//DiviceType.iPod_Touch_1G
        case "iPod2,1":                                 return 789//DiviceType.iPod_Touch_2G
        case "iPod3,1":                                 return 930//DiviceType.iPod_Touch_3G
        case "iPod4,1":                                 return 930//DiviceType.iPod_Touch_4G
        case "iPod5,1":                                 return 1030//DiviceType.iPod_Touch_5Gen
        case "iPod7,1":                                 return 1043//DiviceType.iPod_Touch_6G
            
        case "iPad1,1":                                 return 6613//DiviceType.iPad_1
        case "iPad1,2":                                 return 6613//DiviceType.iPad_3G
        case "iPad2,1":                                 return 6930//DiviceType.iPad_2_WiFi
        case "iPad2,2":                                 return 6930//DiviceType.iPad_2_GSM
        case "iPad2,3":                                 return 6930//DiviceType.iPad_2_CDMA
        case "iPad2,4":                                 return 6930//DiviceType.iPad_2_CDMA
        case "iPad2,5":                                 return 4440//DiviceType.iPad_Mini_WiFi
        case "iPad2,6":                                 return 4440//DiviceType.iPad_Mini_GSM
        case "iPad2,7":                                 return 4440//DiviceType.iPad_Mini_CDMA
        case "iPad3,1":                                 return 11560//DiviceType.iPad_3_WiFi
        case "iPad3,2":                                 return 11560//DiviceType.iPad_3_GSM
        case "iPad3,3":                                 return 11560//DiviceType.iPad_3_CDMA
        case "iPad3,4":                                 return 11560//DiviceType.iPad_4_WiFi
        case "iPad3,5":                                 return 11560//DiviceType.iPad_4_GSM
        case "iPad3,6":                                 return 11560//DiviceType.iPad_4_CDMA
        case "iPad4,1":                                 return 8827//DiviceType.iPad_Air
        case "iPad4,2":                                 return 8827//DiviceType.iPad_Air_Cellular
        case "iPad4,4":                                 return 6471//DiviceType.iPad_Mini_2
        case "iPad4,5":                                 return 6471//DiviceType.iPad_Mini_2_Cellular
        case "iPad4,7":                                 return 6471//DiviceType.iPad_Mini_3_WiFi
        case "iPad4,8":                                 return 6471//DiviceType.iPad_Mini_3_Cellular
        case "iPad4,9":                                 return 6471//DiviceType.iPad_Mini_3_Cellular
        case "iPad5,1":                                 return 5124//DiviceType.iPad_Mini_4_WiFi
        case "iPad5,2":                                 return 5124//DiviceType.iPad_Mini_4_Cellular
            
        case "iPad5,3":                                 return 7340//DiviceType.iPad_Air_2_WiFi
        case "iPad5,4":                                 return 7340//DiviceType.iPad_Air_2_Cellular
        case "iPad6,3":                                 return 7306//DiviceType.iPad_Pro_97inch_WiFi
        case "iPad6,4":                                 return 7306//DiviceType.iPad_Pro_97inch_Cellular
        case "iPad6,7":                                 return 10307//DiviceType.iPad_Pro_129inch_WiFi
        case "iPad6,8":                                 return 10307//DiviceType.iPad_Pro_129inch_Cellular
            
        case "iPad6,11":                                 return 8820//DiviceType.iPad_5_WiFi
        case "iPad6,12":                                 return 8820//DiviceType.iPad_5_Cellular
        case "iPad7,1":                                 return 10307//DiviceType.iPad_Pro_129inch_2nd_gen_WiFi
        case "iPad7,2":                                 return 10307//DiviceType.iPad_Pro_129inch_2nd_gen_Cellular
        case "iPad7,3":                                 return 8134//DiviceType.iPad_Pro_105inch_WiFi
        case "iPad7,4":                                 return 8820//DiviceType.iPad_6
            
        case "AppleTV2,1":                                 return 0//DiviceType.appleTV2
        case "AppleTV3,1":                                 return 0//DiviceType.appleTV3
        case "AppleTV3,2":                                 return 0//DiviceType.appleTV3
        case "AppleTV5,3":                                 return 0//DiviceType.appleTV4
            
        case "i386":                                 return 0//DiviceType.i386Simulator
        case "x86_64":                                 return 0//DiviceType.x86_64Simulator
            
        default:                                        return 0
        }
    }
    
    func transformMachineToIdevice () ->String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
}
