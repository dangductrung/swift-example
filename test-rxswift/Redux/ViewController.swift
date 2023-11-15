//
//  ViewController.swift
//  CounterExample
//
//  Created by Colin Eberhardt on 04/08/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import UIKit
import ReSwift
import SnapKit
import RxSwift

class ViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        fetchCountryAction.disposable?.dispose()
    }
    
    func newState(state: AppState) {
        // when the state changes, the UI is updated to reflect the current state
        countLabel.text = "\(mainStore.state.counter)"
        
        switch mainStore.state.countryListState {
            case .loading:
                countryLabel.text = "Loading..."
            case .success(let data):
                countryLabel.text = data
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // subscribe to state changes
        mainStore.subscribe(self)
        mainStore.dispatch(fetchCountryAction)
        
        addView()
        setConstraint()
        visualize()
        bind()
    }
    
    private var fetchCountryAction = FetchCountryAction()
    
    private var countLabel = UILabel()
    private var countryLabel = UILabel()
    private var stackView = UIStackView()
    private var increaseButton = UIButton()
    private var decreaseButton = UIButton()
    private var disposeBag = DisposeBag()
    
    private func addView() {
        view.addSubview(countLabel)
        view.addSubview(stackView)
        view.addSubview(countryLabel)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(increaseButton)
    }
    
    private func setConstraint() {
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        countryLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        increaseButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        decreaseButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func visualize() {
        view.backgroundColor = .white
        
        countLabel.text = "0"
        countLabel.textColor = .black
        countLabel.font = UIFont.systemFont(ofSize: 30)
        
        countryLabel.text = "Loading..."
        countryLabel.textColor = .black
        countryLabel.font = UIFont.systemFont(ofSize: 16)
        countryLabel.textAlignment = .center
        countryLabel.numberOfLines = 0
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        increaseButton.setTitle("+", for: .normal)
        increaseButton.setTitleColor(.white, for: .normal)
        increaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        increaseButton.backgroundColor = .blue
        increaseButton.layer.cornerRadius = 5
        
        decreaseButton.setTitle("-", for: .normal)
        decreaseButton.setTitleColor(.white, for: .normal)
        decreaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        decreaseButton.backgroundColor = .red
        decreaseButton.layer.cornerRadius = 5
    }
    
    func bind() {
        increaseButton
            .rx
            .tap
            .subscribe(onNext: {
                mainStore.dispatch(increaseThunk)
            })
            .disposed(by: disposeBag)
        
        decreaseButton
            .rx
            .tap
            .subscribe(onNext: {
                mainStore.dispatch(decreaseThunk)
            })
            .disposed(by: disposeBag)
    }
    
 

}

