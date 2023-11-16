//
//  CounterViewController.swift
//  CounterExample
//
//  Created by Colin Eberhardt on 04/08/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import UIKit
import ReSwift
import SnapKit
import RxSwift

extension CounterViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = CounterViewState
    
    func newState(state: CounterViewState) {
        countLabel.text = "\(state.count)"
    }
}

class CounterViewController: UIViewController {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainStore.subscribe(self, transform: {
            $0.select(CounterViewState.init)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    private var countLabel = UILabel()
    private var stackView = UIStackView()
    private var increaseButton = UIButton()
    private var decreaseButton = UIButton()
    private var disposeBag = DisposeBag()
    
    private func setupView() {
        
        addView()
        setConstraint()
        visualize()
        bind()
    }
    
    private func addView() {
        view.addSubview(countLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(increaseButton)
    }
    
    private func setConstraint() {
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
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

