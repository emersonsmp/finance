//
//  CustomCell.swift
//  Finance
//
//  Created by Emerson Sampaio on 05/05/23.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    static let reuseID = "CustomCell"
    static let rowHeight: CGFloat = 70
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "transfer")
        return icon
    }()
    
    lazy var username: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 14)
        return name
    }()
    
    lazy var bankLabel: UILabel = {
        let bank = UILabel()
        bank.translatesAutoresizingMaskIntoConstraints = false
        bank.textColor = .black
        bank.font = UIFont.boldSystemFont(ofSize: 12)
        return bank
    }()
    
    lazy var valueLabel: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textColor = .black
        value.font = UIFont.boldSystemFont(ofSize: 12)
        return value
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(icon)
        addSubview(username)
        addSubview(bankLabel)
        addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
            
            username.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            
            bankLabel.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 2),
            bankLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}

extension CustomCell {
    func configure(with model: Transaction) {
        username.text = model.userName
        bankLabel.text = model.bank
        icon.image = model.image
        valueLabel.text = "$\(model.value)"
        valueLabel.textColor = model.value > 0 ? .systemGreen : .systemRed
    }
}
