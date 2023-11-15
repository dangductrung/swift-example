//
//  CountryListModel.swift
//  test-rxswift
//
//  Created by Trung Dang on 27/07/2023.
//

import Foundation

struct CountryListModel: Codable {
    let code: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}
