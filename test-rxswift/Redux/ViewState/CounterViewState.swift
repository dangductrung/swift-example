//
//  CounterViewState.swift
//  test-rxswift
//
//  Created by Trung Dang on 16/11/2023.
//

import Foundation

struct CounterViewState: Equatable {
    let count: Int
    
    init(_ appState: AppState) {
        count = appState.counter
    }
}
