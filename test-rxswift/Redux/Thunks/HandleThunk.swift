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

let fetchCountryListThunk = Thunk<AppState> { dispatch, getState in
    let apiCalling = DI.resolve(type: APICalling.self)
    let result: Observable<[CountryListModel]> = apiCalling.send(apiRequest: APIRequest())
    let disposable = result
            .subscribe(
                onNext: { countryList in
                    let listData = countryList.map { $0.name }.joined(separator: ", ")
                    dispatch(UpdateCountryData(countryList: listData))
                }
            )
}
