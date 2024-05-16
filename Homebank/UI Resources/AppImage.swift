import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }

    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

enum AppImage: String, AppImageProtocol {
    case avatar = "avatar"
    case tab_main = "tab_main"
    case tab_qr = "tab_qr"
    case tab_accounts = "tab_accounts"
    case tab_menu = "tab_menu"
    
    case info_century = "info_century"
    case info_invest = "info_invest"
    case info_gosuslugi = "info_gosuslugi"
    case info_ipoteka = "info_ipoteka"
    
    case mb_gosuslugi = "mb_gosuslugi"
    case mb_info = "mb_info"
    case mb_invest = "mb_invest"
    case mb_market = "mb_market"
    case mb_perevody = "mb_perevody"
    case mb_platezhi = "mb_platezhi"
    case mb_strahovka = "mb_strahovka"
    case mb_travel = "mb_travel"
    
    case poster_bonus = "poster_bonus"
    case poster_century = "poster_century"
    case poster_setanta = "poster_setanta"
    case poster_vybory = "poster_vybory"
    
    case eb_credit = "eb_credit"
    case eb_rassrochka = "eb_rassrochka"
    case eb_deposit = "eb_deposit"
    case eb_club = "eb_club"
    
    case navbar_history = "navbar_history"
    case navbar_bell = "navbar_bell"
    case navbar_message = "navbar_message"
}
