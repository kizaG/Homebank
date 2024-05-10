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
    case greenTabIcon = "01B071"
    
    case greyTabIcon = "646464"
    case greyBackground = "EDEEF0"
}
