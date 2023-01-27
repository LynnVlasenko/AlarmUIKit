//
//  WorldTimeViewCell.swift
//  AlarmUIKit
//
//  Created by Алина Власенко on 27.01.2023.
//

import UIKit

class WorldTimeViewCell: UITableViewCell {

    static let identifier = "WorldTimeViewCell"
    
    private let cityLbl: UILabel = {
        let label = UILabel ()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLbl: UILabel = {
        let label = UILabel ()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .light)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init (style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(statusLbl)
        contentView.addSubview(cityLbl)
        contentView.addSubview(timeLbl)
        
        applyConstraints()
        setupView()
    }
    
    required init? (coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
       
        let statusLblConstraints  = [
            statusLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            statusLbl.topAnchor.constraint (equalTo: contentView.topAnchor, constant: 10)
        ]
        
        let cityLblConstraints = [
            cityLbl.leadingAnchor.constraint(equalTo:contentView.leadingAnchor,constant:20),
            cityLbl.topAnchor.constraint (equalTo: statusLbl.bottomAnchor),
            cityLbl.bottomAnchor.constraint(equalTo:contentView.bottomAnchor,constant: -20),
        ]
        
        let timeLblConstraints = [
            timeLbl.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
            timeLbl.trailingAnchor.constraint(equalTo:contentView.trailingAnchor,constant: -20)
        ]
        
        NSLayoutConstraint.activate(timeLblConstraints)
        NSLayoutConstraint.activate(statusLblConstraints)
        NSLayoutConstraint.activate(cityLblConstraints)
        
    }
    
    //додала функцію щоб зробити чорний фон для таблиці
    private func setupView() {
        self.backgroundColor = .black
    }
    
    func configure(time: String, status: String, city: String) {
            timeLbl.text = time
            statusLbl.text = status
            cityLbl.text = city
        }

}


