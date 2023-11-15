//
//  AddressViewModel.swift
//  test-rxswift
//
//  Created by Trung Dang on 27/07/2023.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa

enum AddressViewCellType {
    case normal(cellViewModel: CountryListModel)
    case error(message: String)
    case empty
}

class AddressViewModel {
    
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[AddressViewCellType]>(value: [])
    
    var showLoadingHud: Observable<Bool> {
        return loadInProgress.asObservable().distinctUntilChanged()
    }
    var addressCells : Observable<[AddressViewCellType]> {
        return cells.asObservable()
    }
    
    
    let apiCalling: APICalling
    let disposeBag = DisposeBag()
    
    // DI
    init(apiCalling: APICalling = DI.resolve()) {
        self.apiCalling = apiCalling
    }
    
    func getAddress() {
        loadInProgress.accept(true)
        
        defer {
            loadInProgress.accept(false)
        }
        
        let result: Observable<[CountryListModel]> = self.apiCalling.send(apiRequest: APIRequest())
        
        result
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .map { value -> [CountryListModel] in
                let isMainThread = Thread.isMainThread
                let threadName = isMainThread ? "Main Thread" : Thread.current.name
                print("😀 Queue0: \(threadName)")
                return value
            }
            .observeOn(ConcurrentDispatchQueueScheduler(queue: .global(qos: .utility)))
            .map { value -> [CountryListModel] in
                let isMainThread = Thread.isMainThread
                let threadName = isMainThread ? "Main Thread" : Thread.current.name
                print("😀 Queue1: \(threadName)")
                return value
            }
            .observeOn(ConcurrentDispatchQueueScheduler(queue: .global(qos: .userInteractive)))
            .map { value -> [CountryListModel] in
                let isMainThread = Thread.isMainThread
                let threadName = isMainThread ? "Main Thread" : Thread.current.name
                print("😀 Queue2: \(threadName)")
                return value
            }
            .observeOn(MainScheduler.instance)
            .map { value -> [CountryListModel] in
                let isMainThread = Thread.isMainThread
                let threadName = isMainThread ? "Main Thread" : Thread.current.name
                print("😀 Queue3: \(threadName)")
                return value
            }
            .subscribe(
                onNext: { [weak self] countryList in
                    guard countryList.count > 0 else {
                        self?.cells.accept([.empty])
                        return
                    }
                    self?.cells.accept(countryList.compactMap {.normal(cellViewModel: $0 as CountryListModel)})
                },
                onError: { [weak self] error in
                    self?.cells.accept([.error(message: "Test message")])
                }
            ).disposed(by: self.disposeBag)
        
    }
    
}
