import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {
    
    var uiColor: UIColor {
        UIColor.init(named: rawValue) ?? .white
    }
    
    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case white = "FFFFFF"
    case black = "000000"
    case green01 = "01B071"
    case green02 = "0CC582"
    
    case grey01 = "EDEEF0"
    case grey02 = "646464"
    case grey03 = "E3E4E8"
    case grey04 = "404040"
    case grey05 = "D9D9D9"
    
    case yellow = "FFBF28"
    
    case red01 = "FF8686"
    case red02 = "FF6666"
}
