//
//  TestCollectionView.swift
//  test-rxswift
//
//  Created by Trung Dang on 26/07/2023.
//

import UIKit
import SnapKit

class TestCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    
    private var navTitle: String
    
    public init(navTitle: String) {
        self.navTitle = navTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titles = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "1",
        "2",
        "3",
        "4",
        "5",
        "1",
        "2",
        "3",
        "4",
        "5",
        "1",
        "2",
        "3",
        "4",
        "5","1",
        "2",
        "3",
        "4",
        "5","1",
        "2",
        "3",
        "4",
        "5","1",
        "2",
        "3",
        "4",
        "5","1",
        "2",
        "3",
        "4",
        "5","1",
        "2",
        "3",
        "4",
        "5","1",
        "2",
        "3",
        "4",
        "5",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupCollectionView()
        
    }
    
    func setupNavTitle() {
        self.navigationItem.title = navTitle
    }
    
    func setupUI() {
        setupNavTitle()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        self.view.addSubview(collectionView)
        
        
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! TestCollectionViewCell
        cell.title = titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}

