//
//  AccountsListSection.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 17.05.2024.
//

import Foundation

enum AccountsListSection {
    case cards([AccountsListItem])
    case buttons([AccountsListItem])
    
    var items: [AccountsListItem] {
        switch self {
        case .cards(let items),
                .buttons(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
}
