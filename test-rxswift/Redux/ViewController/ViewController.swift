//
//  ViewController.swift
//  test-rxswift
//
//  Created by Trung Dang on 16/11/2023.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

public class ViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    
    private var stackView = UIStackView()
    private var toCounterButton = UIButton()
    private var toCountryListButton = UIButton()
    
    private var disposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        addView()
        setConstraint()
        visualize()
        bind()
    }
    
    
    private func addView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(toCounterButton)
        stackView.addArrangedSubview(toCountryListButton)
    }
    
    private func setConstraint() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        toCounterButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        toCountryListButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
    }
    
    private func visualize() {
        view.backgroundColor = .white
        
        toCounterButton.setTitle("Counter", for: .normal)
        toCounterButton.setTitleColor(.white, for: .normal)
        toCounterButton.backgroundColor = .blue
        toCounterButton.layer.cornerRadius = 8
        
        toCountryListButton.setTitle("Country List", for: .normal)
        toCountryListButton.setTitleColor(.white, for: .normal)
        toCountryListButton.backgroundColor = .blue
        toCountryListButton.layer.cornerRadius = 8
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
    }
    
    private func bind() {
        toCounterButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let vc = CounterViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
        
        toCountryListButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let vc = CountryListViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
