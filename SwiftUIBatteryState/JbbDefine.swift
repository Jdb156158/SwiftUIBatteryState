//
//  JbbDefine.swift
//  SwiftUIAll
//
//  Created by db J on 2020/12/31.
//

import UIKit

extension UIDevice {
    
    static var isMordenPhone: Bool {
        let size = ScreenHelper.mainBounds.size
        switch size {
        /// iPhone X/Xs/11Pro
        case CGSize(width: 375, height: 812), CGSize(width: 812, height: 375):
            return true
        /// iPhone XsMax/Xr/11/11ProMax
        case CGSize(width: 414, height: 896), CGSize(width: 896, height: 414):
            return true
        default:
            return false
        }
    }
}

struct ScreenHelper {
    
    static var mainBounds: CGRect {
        if #available(iOS 13, *) {
            for scene in UIApplication.shared.connectedScenes {
                if scene.activationState == .foregroundActive {
                    if let delegate = scene.delegate as? UIWindowSceneDelegate {
                        if let frame = delegate.window??.bounds {
                            return frame
                        }
                    }
                }
            }
        }
        return UIApplication.shared.windows[0].bounds
    }
}

struct StatusBarHelper {
    
    static var height: CGFloat {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                return windowScene.statusBarManager?.statusBarFrame.height ?? defaultHeight
            } else {
                // Should never use this code.
                return defaultHeight
            }
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
    private static var defaultHeight: CGFloat {
        return UIDevice.isMordenPhone ? 44 : 20
    }
}

// MARK: - 屏幕宽高
let KScreenWidth = UIScreen.main.bounds.size.width
let KScreenHeight = UIScreen.main.bounds.size.height

let KNavHeight : CGFloat = iPhone_X ? iPhoneX_Nav_Height : Default_Nav_Height

// MARK: - 宽度比例尺
let KWidth_proportion: CGFloat = KScreenWidth / 375
let KHeight_proportion: CGFloat = KScreenHeight / 667

// MARK: - 设备为 iPhoneX
let iPhone_X : Bool = KScreenHeight >= 812

let iPhone_5s : Bool = KScreenWidth == 320
let iPhone_6s : Bool = KScreenHeight == 667
let iPhone_6sp : Bool = KScreenWidth == 414
// MARK: - 设备为 5s及以下
let iPhone_5S_Below : Bool = KScreenHeight <= 568

let Status_Bar_Height: CGFloat = StatusBarHelper.height
let iPhoneX_Nav_Height : CGFloat = 88
let Default_Nav_Height : CGFloat = iPhone_X ? 88 : 64
let iPhoneX_Bottom_Height : CGFloat = iPhone_X ? 34 : 0
let iPhoneX_Bottom_Backline_Height : CGFloat = iPhone_X ? 10 : 0
let iPhoneX_Top_Height : CGFloat = 44
let Default_Tabbar_Height : CGFloat = 49 + iPhoneX_Bottom_Height

let Default_Color : UIColor = UIColorFromHex(0xffcf11)
let Name_Color : UIColor = UIColorFromHex(0x333333)
//字体黑色
let Default_BlackTextColor : UIColor = UIColorFromHex(0x1a1a1a)
//灰色背景、line
let Default_BGColor : UIColor = UIColorFromHex(0xf1f1f1)

//通过RGB生成颜色
func UIColorFromRGB(R:CGFloat,G:CGFloat,B:CGFloat) -> UIColor?{
    
    return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: 1.0)
}

//通过RGBA生成颜色
func UIColorFromRGBA(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) -> UIColor?{
    
    return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha:CGFloat(A))
}


// MARK: - 十六进制颜色
var UIColorFromHex: (NSInteger) -> UIColor = {hex in
    
    let redValue = ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0
    let greenValue = ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0
    let blueValue = ((CGFloat)(hex & 0xFF)) / 255.0
    
    return UIColor(red: redValue, green:greenValue, blue: blueValue, alpha: 1);
}

// MARK: - 系统字号
func FONT(_ font:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: font * KWidth_proportion)
}

// MARK: - 粗体字号
func BOLDFONT(_ font:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: font * KWidth_proportion)
}

func swiftClassFromString(className: String) -> AnyClass! {
    // get the project name
    if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
        // YourProject.className
        let classStringName = appName + "." + className
        return NSClassFromString(classStringName)
    }
    return nil;
}
