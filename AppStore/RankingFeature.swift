//
//  RankingFeature.swift
//  AppStore
//
//  Created by 구희정 on 2022/07/25.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
