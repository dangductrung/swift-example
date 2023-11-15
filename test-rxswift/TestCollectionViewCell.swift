//
//  TestCollectionViewCell.swift
//  test-rxswift
//
//  Created by Trung Dang on 26/07/2023.
//

import UIKit
import SnapKit

class TestCollectionViewCell: UICollectionViewCell {
    public var title: String {
        get {
            return title
        }
        
        set {
            label.text = newValue
        }
    }
    
    private var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(label)
        self.backgroundColor = .red
        
        label.snp.makeConstraints{ (make) in
            make.center.equalToSuperview()
        }
    }
}
