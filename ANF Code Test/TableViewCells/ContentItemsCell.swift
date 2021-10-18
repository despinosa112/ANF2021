//
//  ContentItemsCell.swift
//  ANF Code Test
//
//  Created by Daniel Espinosa on 10/14/21.
//

import UIKit

class ContentItemsCell: UITableViewCell {
    
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 3
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.addSubview(itemLabel)
        itemLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        itemLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        itemLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        itemLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(contentItem: ContentItem) {
        if let title = contentItem.title {
            self.itemLabel.text = title
        }
    }
    
}
