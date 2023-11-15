//
//  Middlewares.swift
//  test-rxswift
//
//  Created by Trung Dang on 16/11/2023.
//

import Foundation
import RxSwift
import ReSwift
import ReSwiftThunk

let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()

let apiMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
           guard var apiAction = action as? FetchCountryAction else {
                return next(action)
            }

            let apiCalling = DI.resolve(type: APICalling.self)
            let result: Observable<[CountryListModel]> = apiCalling.send(apiRequest: APIRequest())
            let disposable = result
                .subscribe(
                    onNext: { countryList in
                        let listData = countryList.map { $0.name }.joined(separator: ", ")
                        dispatch(UpdateCountryAction(countryList: listData))
                    }
                )

            apiAction.disposable = disposable
        }
    }
}
