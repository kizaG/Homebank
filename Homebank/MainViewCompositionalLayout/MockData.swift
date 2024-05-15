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
        .infos([.init(image: AppImage.info_century.rawValue, title: "", extraText: "", backgroundColor: ""),
                .init(image: AppImage.info_invest.rawValue, title: "", extraText: "", backgroundColor: ""),
                .init(image: AppImage.info_gosuslugi.rawValue, title: "", extraText: "", backgroundColor: ""),
                .init(image: AppImage.info_ipoteka.rawValue, title: "", extraText: "", backgroundColor: ""),])
    }()
    
    private let mainButtons: ListSection = {
        .mainButtons([.init(image: AppImage.mb_perevody.rawValue, title: "Переводы", extraText: "", backgroundColor: ""),
                      .init(image: AppImage.mb_platezhi.rawValue, title: "Платежи", extraText: "", backgroundColor: ""),
                      .init(image: AppImage.mb_travel.rawValue, title: "Travel", extraText: "", backgroundColor: ""),
                      .init(image: AppImage.mb_invest.rawValue, title: "Halyk invest", extraText: "Вклад в будущее", backgroundColor: ""),
                      .init(image: AppImage.mb_gosuslugi.rawValue, title: "Госуслуги", extraText: "Быстро и удобно", backgroundColor: ""),
                      .init(image: AppImage.mb_strahovka.rawValue, title: "Страховка", extraText: "", backgroundColor: ""),
                      .init(image: AppImage.mb_market.rawValue, title: "Маркет", extraText: "", backgroundColor: ""),
                      .init(image: AppImage.mb_info.rawValue, title: "Инфо", extraText: "", backgroundColor: ""),])
        
    }()
    
    private let posters: ListSection = {
        .posters([.init(image: AppImage.poster_century.rawValue, title: "", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.poster_bonus.rawValue, title: "", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.poster_setanta.rawValue, title: "", extraText: "", backgroundColor: ""),
                  .init(image: AppImage.poster_vybory.rawValue, title: "", extraText: "", backgroundColor: ""),])
    }()
    
    private let extraButtons: ListSection = {
        .extraButtons([.init(image: AppImage.eb_credit.rawValue, title: "Получить Кредит", extraText: "", backgroundColor: AppColor.green02.rawValue),
                       .init(image: AppImage.eb_rassrochka.rawValue, title: "Рассрочка 0 • 0 • 24", extraText: "", backgroundColor: AppColor.green02.rawValue),
                       .init(image: AppImage.eb_deposit.rawValue, title: "Halyk Депозит", extraText: "", backgroundColor: AppColor.green02.rawValue),
                       .init(image: AppImage.eb_club.rawValue, title: "Halyk Club", extraText: "", backgroundColor: AppColor.yellow.rawValue),])
    }()
    
    var pageData: [ListSection] {
        [infos, mainButtons, posters, extraButtons]
    }
}
