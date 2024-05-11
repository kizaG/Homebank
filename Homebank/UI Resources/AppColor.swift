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
    
    case grey01 = "EDEEF0"
    case grey02 = "646464"
}
