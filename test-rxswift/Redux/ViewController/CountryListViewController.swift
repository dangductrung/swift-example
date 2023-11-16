//
//  CountryListViewController.swift
//  CounterExample
//
//  Created by Colin Eberhardt on 04/08/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import UIKit
import ReSwift
import SnapKit
import RxSwift

extension CountryListViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = CountryListViewState
    
    func newState(state: CountryListViewState) {
        countryLabel.text = state.countryList
    }
}

class CountryListViewController: UIViewController {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        fetchCountryAction.disposable?.dispose()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainStore.subscribe(self, transform: {
            $0.select(CountryListViewState.init)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStore.dispatch(fetchCountryAction)
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    private var fetchCountryAction = FetchCountryAction()
    
    private var countryLabel = UILabel()
    private var disposeBag = DisposeBag()
    
    private func setupView() {
        addView()
        setConstraint()
        visualize()
    }
    
    private func addView() {
        view.addSubview(countryLabel)
    }
    
    private func setConstraint() {
        countryLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.center.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func visualize() {
        view.backgroundColor = .white

        countryLabel.text = "Loading..."
        countryLabel.textColor = .black
        countryLabel.font = UIFont.systemFont(ofSize: 16)
        countryLabel.textAlignment = .center
        countryLabel.numberOfLines = 0
    }
    
}

