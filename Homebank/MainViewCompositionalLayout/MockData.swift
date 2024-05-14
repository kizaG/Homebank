//
//  MockData.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let infos: ListSection = {
        .infos([.init(image: "century_halyk", title: "", extraText: ""),
                .init(image: "invest_gold", title: "", extraText: ""),
                .init(image: "gosuslugi", title: "", extraText: ""),
                .init(image: "ipoteka", title: "", extraText: ""),])
    }()
    
    private let mainButtons: ListSection = {
        .mainButtons([.init(image: "century_halyk", title: "", extraText: ""),
                      .init(image: "invest_gold", title: "", extraText: ""),
                      .init(image: "gosuslugi", title: "", extraText: ""),
                      .init(image: "ipoteka", title: "", extraText: ""),])
        
    }()
    
//    private let posters: ListSection = {
//        .posters([.init(image: "century", title: "", extraText: ""),
//                .init(image: "invest_gold", title: "", extraText: ""),
//                .init(image: "gosuslugi", title: "", extraText: ""),
//                .init(image: "ipoteka", title: "", extraText: ""),])
//    }()
//
//    private let extraButtons: ListSection = {
//        .extraButtons([.init(image: "century", title: "", extraText: ""),
//                       .init(image: "invest_gold", title: "", extraText: ""),
//                       .init(image: "gosuslugi", title: "", extraText: ""),
//                       .init(image: "ipoteka", title: "", extraText: ""),])
//    }()
    
    var pageData: [ListSection] {
        [infos, mainButtons]
//        [infos, mainButtons, posters, extraButtons]
    }
}
