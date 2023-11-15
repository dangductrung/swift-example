//
//  ViewController.swift
//  test-rxswift
//
//  Created by Trung Dang on 25/07/2023.
//

import UIKit
import RxSwift
import SnapKit
import PKHUD

class AddressViewController: UIViewController  {
    let textField = UITextField()
    let mainTableView = UITableView()
    private let addressViewModel = AddressViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        mainTableView.register(TableViewCell.self, forCellReuseIdentifier: "cellID")
        
        setupUI()
        bindViewData()
        setupTableViewHandle()
        addressViewModel.getAddress()
        
    }
    
    func bindViewData() {
        addressViewModel.showLoadingHud.map { [weak self] in
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            $0 ? PKHUD.sharedHUD.show(onView: self?.view) : PKHUD.sharedHUD.hide()
        }.subscribe().disposed(by: disposeBag)
        
        addressViewModel.addressCells.bind(to: self.mainTableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
                case .normal(let viewModel):
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? TableViewCell else {
                        return UITableViewCell()
                    }
                    
                    cell.title = viewModel.name
                    cell.color = UIColor.red
                    return cell
                    
                case .error(let message):
                    let cell = UITableViewCell()
                    cell.isUserInteractionEnabled = false
                    cell.textLabel?.text = message
                    return cell
                case .empty:
                    let cell = UITableViewCell()
                    cell.isUserInteractionEnabled = false
                    cell.textLabel?.text = "No data available"
                    return cell
            }
        }.disposed(by: disposeBag)
    }
    
    func setupTableViewHandle() {
        self.mainTableView
            .rx
            .modelSelected(AddressViewCellType.self)
            .subscribe(
                onNext: { [weak self] cellType in
                    guard let indexPath = self?.mainTableView.indexPathForSelectedRow else {
                        return
                    }
                    self?.mainTableView.deselectRow(at: indexPath, animated: true)
                    
                    switch cellType {
                        case .normal(let viewModel):
                            NavigationImpl.shared.navigate2CollectionView(selectedCountry: viewModel.name)
                        case .error(_):
                            break
                        case .empty:
                            break
                    }
                }
            ).disposed(by: disposeBag)
    }
    
    
    func setupUI() {
        self.view.addSubview(mainTableView)
        
        //tất cả các cạnh của tableVIew trùng với các cạnh màn hình.
        mainTableView.snp.makeConstraints{make in
            make.right.left.top.bottom.equalToSuperview()
            
            
        }
                
        self.navigationItem.title = "List Country"
    }
    
    
}





