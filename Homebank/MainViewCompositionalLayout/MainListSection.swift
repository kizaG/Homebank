//
//  MainListSection.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import Foundation

enum MainListSection {
    case infos([MainListItem])
    case mainButtons([MainListItem])
    case posters([MainListItem])
    case extraButtons([MainListItem])
    
    var items: [MainListItem] {
        switch self {
        case .infos(let items),
                .mainButtons(let items),
                .posters(let items),
                .extraButtons(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
}
