//
//  ContentView.swift
//  swiftUiCase
//
//  Created by 9haomi on 2020/12/20.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        //print(jbb_drivece())
        NotificationCenter.default.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: nil) { (Notification) in
            print("11111111111")
        }
        
        NotificationCenter.default.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: nil) { (Notification) in
            print("222222222222")
        }
    
//        NotificationCenter.default.addObserver(self, selector: Selector("batteryLevelChanged"), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: Selector("batteryLevelChanged"), name: UIDevice.batteryStateDidChangeNotification, object: nil)
    }
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
    }
    func jbb_drivece() -> Float {
        return UIDevice().batteryLevel
    }
    
    func batteryLevelChanged(){
        //do stuff using the userInfo property of the notification object
        print("Moving back to the foreground!")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
