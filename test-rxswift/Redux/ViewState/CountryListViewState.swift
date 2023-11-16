//
//  CountryListViewState.swift
//  test-rxswift
//
//  Created by Trung Dang on 16/11/2023.
//

import Foundation

struct CountryListViewState: Equatable {
    let countryList: String
    
    init(_ appState: AppState) {
        switch(appState.countryListState) {
            case .loading:
                countryList = "Loading..."
            case .success(let data):
                countryList = data
        }
        
    }
}
