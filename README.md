# SwiftUIBatteryState
- SwiftUI项目中怎么监听设备的电池信息
- 目前实现：电量变化，充电、放电、充满状态，电池设计容量（电池容量），电池充电功率

# 使用方法

``` swift
        let helper:batteryService =  batteryService()
        //电池状态
        helper.batteryStateResults = {(newbatteryState)  in
            //刷新你的ui
            print(newbatteryState)
        }
        
        //电池电量变化
        helper.batteryLevelResults = { (leve) in
            //刷新你的ui
            print(leve)
        }
        
        //电池容量
        helper.batteryContainerResults = { (container) in
            //刷新你的ui
            print(container)
        }
        
        //电池功率
        helper.batteryPowerResults = { (power) in
            //刷新你的ui
            print(power)
        }
```