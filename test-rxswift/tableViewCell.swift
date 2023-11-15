//
//  tableViewCell.swift
//  test-rxswift
//
//  Created by Trung Dang on 26/07/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "example"
        return label
    }()
    
    let imageSize: CGFloat = 40
    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.orange
        return image
    }()
    
    public var title: String  {
        set {
            self.cellLabel.text = newValue
        }
        
        get {
            return title
        }
    }
    
    public var color: UIColor  {
        set {
            self.cellImage.backgroundColor = newValue
        }
        get {
            return color
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cellID")
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
            contentView.addSubview(cellImage)
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            cellImage.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
            cellImage.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
            
            contentView.addSubview(cellLabel)
            cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            cellLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

}
