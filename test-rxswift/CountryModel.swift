//
//  CountryModel.swift
//  test-rxswift
//
//  Created by Trung Dang on 27/07/2023.
//

import Foundation

struct CountryModel: Codable {
    let code: Int?
    let result: [CountryListModel]?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case result
    }
}
