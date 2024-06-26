//
//  MainMockData.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import UIKit

struct MainMockData {
    
    static let shared = MainMockData()
    
    private let infos: MainListSection = {
        .infos([.init(image: AppImage.info_century.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
                .init(image: AppImage.info_invest.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
                .init(image: AppImage.info_gosuslugi.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
                .init(image: AppImage.info_ipoteka.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),])
    }()
    
    private let mainButtons: MainListSection = {
        .mainButtons([.init(image: AppImage.mb_perevody.rawValue, title: "Переводы", extraText: "", backgroundColor: "", vc: TransfersViewController()),
                      .init(image: AppImage.mb_platezhi.rawValue, title: "Платежи", extraText: "", backgroundColor: "", vc: UIViewController()),
                      .init(image: AppImage.mb_travel.rawValue, title: "Travel", extraText: "", backgroundColor: "", vc: UIViewController()),
                      .init(image: AppImage.mb_invest.rawValue, title: "Halyk invest", extraText: "Вклад в будущее", backgroundColor: "", vc: UIViewController()),
                      .init(image: AppImage.mb_gosuslugi.rawValue, title: "Госуслуги", extraText: "Быстро и удобно", backgroundColor: "", vc: UIViewController()),
                      .init(image: AppImage.mb_strahovka.rawValue, title: "Страховка", extraText: "", backgroundColor: "", vc: UIViewController()),
                      .init(image: AppImage.mb_market.rawValue, title: "Маркет", extraText: "", backgroundColor: "", vc: UIViewController()),
                      .init(image: AppImage.mb_info.rawValue, title: "Инфо", extraText: "", backgroundColor: "", vc: UIViewController()),])
        
    }()
    
    private let posters: MainListSection = {
        .posters([.init(image: AppImage.poster_century.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
                  .init(image: AppImage.poster_bonus.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
                  .init(image: AppImage.poster_setanta.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
                  .init(image: AppImage.poster_vybory.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),])
    }()
    
    private let extraButtons: MainListSection = {
        .extraButtons([.init(image: AppImage.eb_credit.rawValue, title: "Получить Кредит", extraText: "", backgroundColor: AppColor.green02.rawValue, vc: UIViewController()),
                       .init(image: AppImage.eb_rassrochka.rawValue, title: "Рассрочка 0 • 0 • 24", extraText: "", backgroundColor: AppColor.green02.rawValue, vc: UIViewController()),
                       .init(image: AppImage.eb_deposit.rawValue, title: "Halyk Депозит", extraText: "", backgroundColor: AppColor.green02.rawValue, vc: UIViewController()),
                       .init(image: AppImage.eb_club.rawValue, title: "Halyk Club", extraText: "", backgroundColor: AppColor.yellow.rawValue, vc: UIViewController()),])
    }()
    
    private let recs: MainListSection = {
        .recs([.init(image: AppImage.info_gosuslugi.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
               .init(image: AppImage.rec_ten.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
               .init(image: AppImage.rec_twelve.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController()),
               .init(image: AppImage.rec_market.rawValue, title: "", extraText: "", backgroundColor: "", vc: UIViewController())])
    }()
    
    var pageData: [MainListSection] {
        [infos, mainButtons, posters, extraButtons, recs]
    }
}
