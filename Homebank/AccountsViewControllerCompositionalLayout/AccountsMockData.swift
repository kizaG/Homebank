//
//  AccountsMockData.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 17.05.2024.
//

import Foundation

struct AccountsMockData {
    
    static let shared = AccountsMockData()
    
    private let cards: AccountsListSection = {
        .cards([.init(image: "accounts_card_1", title: "", extraText: "", backgroundColor: ""),
                .init(image: "accounts_card_2", title: "", extraText: "", backgroundColor: ""),
                .init(image: "accounts_add_card", title: "", extraText: "", backgroundColor: ""),])
    }()
    
    private let buttons: AccountsListSection = {
        .buttons([.init(image: AppImage.accounts_gear.rawValue, title: "Управление картой", extraText: "Настройки и безопасность", backgroundColor: ""),
                  .init(image: AppImage.mb_perevody.rawValue, title: "Переводы", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.mb_platezhi.rawValue, title: "Платежи", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.accounts_popolnit.rawValue, title: "Пополнить", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.accounts_apple.rawValue, title: "Apple pay", extraText: "Быстро и удобно", backgroundColor: ""),
                  .init(image: AppImage.accounts_requisites.rawValue, title: "Реквизиты", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.accounts_block.rawValue, title: "Блокировка", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.accounts_pin.rawValue, title: "Пинкод", extraText: "", backgroundColor: ""),])
        
    }()
    
    var pageData: [AccountsListSection] {
        [cards, buttons]
    }
}
