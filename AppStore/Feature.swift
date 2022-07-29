//
//  Feature.swift
//  AppStore
//
//  Created by 구희정 on 2022/07/25.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
