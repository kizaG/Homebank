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
    case avatar
    case tab_main
    case tab_qr
    case tab_accounts
    case tab_menu
    
    case info_century
    case info_invest
    case info_gosuslugi
    case info_ipoteka
    
    case mb_gosuslugi
    case mb_info
    case mb_invest
    case mb_market
    case mb_perevody
    case mb_platezhi
    case mb_strahovka
    case mb_travel
    
    case poster_bonus
    case poster_century
    case poster_setanta
    case poster_vybory
    
    case eb_credit
    case eb_rassrochka
    case eb_deposit
    case eb_club
    
    case navbar_history
    case navbar_bell
    case navbar_message
    
    case accounts_add_card
    case accounts_apple
    case accounts_block
    case accounts_card_1
    case accounts_card_2
    case accounts_gear
    case accounts_pin
    case accounts_popolnit
    case accounts_requisites
    
    case rec_market
    case rec_ten
    case rec_twelve
    
    case menu_verified
    case menu_settings
    case menu_exit
}
