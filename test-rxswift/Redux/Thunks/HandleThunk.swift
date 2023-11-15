//
//  IncreaseThunk.swift
//  test-rxswift
//
//  Created by Trung Dang on 15/11/2023.
//

import Foundation
import ReSwift
import ReSwiftThunk
import RxSwift

let increaseThunk = Thunk<AppState> { dispatch, getState in
    let currentState = getState()
    print("increaseThunk: \(currentState?.counter ?? 0)")
    
    dispatch(CounterActionIncrease())
}

let decreaseThunk = Thunk<AppState> { dispatch, getState in
    let currentState = getState()
    print("decreaseThunk: \(currentState?.counter ?? 0)")
    
    dispatch(CounterActionDecrease())
}

