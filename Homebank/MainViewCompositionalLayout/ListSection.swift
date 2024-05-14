//
//  ListSection.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import Foundation

enum ListSection {
    case infos([ListItem])
    case mainButtons([ListItem])
//    case posters([ListItem])
//    case extraButtons([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .infos(let items),
                .mainButtons(let items):
//                .posters(let items),
//                .extraButtons(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
}
