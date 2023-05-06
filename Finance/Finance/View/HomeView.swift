//
//  HomeView.swift
//  Finance
//
//  Created by Emerson Sampaio on 05/05/23.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var transactions: [Transaction] = [
        Transaction(icon: "transfer", userName: "Oscar Santos", bank: "Nu Nubank", value: -2300),
        Transaction(icon: "pix", userName: "Pedro Almir", bank: "Bradesco", value: 248),
        Transaction(icon: "transfer", userName: "Paulo Souza", bank: "Itau Unibanco", value: 1500),
        Transaction(icon: "transfer", userName: "Anna Gomes", bank: "Nu Nubank", value: -400),
        Transaction(icon: "pix", userName: "Mary Gomes", bank: "Banco do Brasil", value: -3250)
    ]
    
    lazy var userProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.init(named: "perfil")
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    lazy var username: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.text = "Bom dia, Emerson"
        name.font = UIFont.boldSystemFont(ofSize: 12)
        return name
    }()
    
    lazy var balanceLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.text = "BALANCE"
        name.font = UIFont.boldSystemFont(ofSize: 14)
        return name
    }()
    
    lazy var valueLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.font = UIFont.boldSystemFont(ofSize: 32)
        name.text = "$ 1,235.12"
        return name
    }()
    
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.init(named: "card5")
        return image
    }()

    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    lazy var buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        view.layer.borderWidth = 2.0
        return view
    }()

    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .red
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()

    lazy var icon1: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "transfer")
        return icon
    }()

    lazy var icon2: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "pix")
        return icon
    }()

    lazy var icon3: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "card")
        return icon
    }()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        table.rowHeight = CustomCell.rowHeight
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    func setup(){
        table.dataSource = self
        table.delegate = self
        backgroundColor = .black
        
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func layout(){
        addSubview(userProfileImage)
        addSubview(username)
        addSubview(balanceLabel)
        addSubview(valueLabel)
        addSubview(cardImage)
        addSubview(view)
        addSubview(buttonView)
        addSubview(icon1)
        addSubview(icon2)
        addSubview(icon3)
        addSubview(table)
    }
    
    func constraints(){
        NSLayoutConstraint.activate([
            userProfileImage.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            userProfileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userProfileImage.heightAnchor.constraint(equalToConstant: 40),
            userProfileImage.widthAnchor.constraint(equalToConstant: 40),
            
            username.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            username.centerYAnchor.constraint(equalTo: userProfileImage.centerYAnchor),
            
            balanceLabel.topAnchor.constraint(equalTo: userProfileImage.bottomAnchor , constant: 30),
            balanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            valueLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor , constant: 5),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            cardImage.topAnchor.constraint(equalTo: valueLabel.bottomAnchor , constant: 20),
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardImage.heightAnchor.constraint(equalToConstant: 220),

            view.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),

            buttonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonView.heightAnchor.constraint(equalToConstant: 80),

            icon1.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            icon1.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 50),
            icon1.heightAnchor.constraint(equalToConstant: 30),
            icon1.widthAnchor.constraint(equalToConstant: 30),

            icon2.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            icon2.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            icon2.heightAnchor.constraint(equalToConstant: 30),
            icon2.widthAnchor.constraint(equalToConstant: 30),

            icon3.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            icon3.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -50),
            icon3.heightAnchor.constraint(equalToConstant: 30),
            icon3.widthAnchor.constraint(equalToConstant: 30),
            
            table.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 10),
            table.leadingAnchor.constraint(equalTo: leadingAnchor),
            table.trailingAnchor.constraint(equalTo: trailingAnchor),
            table.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID) as! CustomCell
        cell.configure(with: transactions[indexPath.row])
        return cell
    }
}
