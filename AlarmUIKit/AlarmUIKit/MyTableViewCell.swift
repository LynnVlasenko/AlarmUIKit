//
//  MyTableViewCell.swift
//  table
//
//  Created by Алина Власенко on 26.01.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    static let identifier = "MyTableViewCell"
    
    private let timeLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .light)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLbl: UILabel = {
        let label = UILabel ()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mySwitch: UISwitch = {
        let UISwitch = UISwitch ()
        UISwitch.translatesAutoresizingMaskIntoConstraints = false
        return UISwitch
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init (style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(timeLbl)
        contentView.addSubview(statusLbl)
        contentView.addSubview(mySwitch)
        
        applyConstraints()
        setupView()
    }
    
    required init? (coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
       
        let timeLblConstraints = [
            timeLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeLbl.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10)
        ]
        
        let statusLb1Constraints = [
            statusLbl.leadingAnchor.constraint(equalTo:contentView.leadingAnchor,constant:20),
            statusLbl.topAnchor.constraint (equalTo: timeLbl.bottomAnchor),
            statusLbl.bottomAnchor.constraint(equalTo:contentView.bottomAnchor,constant: -20),
        ]
        
        let uiSwitchConstraints = [
            mySwitch.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
            mySwitch.trailingAnchor.constraint(equalTo:contentView.trailingAnchor,constant: -20)
        ]
        
        NSLayoutConstraint.activate(timeLblConstraints)
        NSLayoutConstraint.activate(statusLb1Constraints)
        NSLayoutConstraint.activate(uiSwitchConstraints)
        
    }
    
    //додала функцію щоб зробити чорний фон для таблиці
    private func setupView() {
        self.backgroundColor = .black
    }
    
    func configure(time: String, status: String) {
            timeLbl.text = time
            statusLbl.text = status
            
        }

}


