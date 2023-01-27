//
//  WorldTimeViewController.swift
//  AlarmUIKit
//
//  Created by Алина Власенко on 27.01.2023.
//

import UIKit

class WorldTimeViewController: UIViewController {
    
    private let timeArray = ["09:00", "07:00"]
    private let statusArray = ["Сьогодні, +1 год", "Сьогодні, -1 год"]
    private let cityArray = ["Київ", "Лісабон"]

    private lazy var titleWorldTime = UILabel()
    private lazy var myTable: UITableView = {
        let table = UITableView()
        
        table.register(WorldTimeViewCell.self, forCellReuseIdentifier: WorldTimeViewCell.identifier)
        
        return table
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //myTable.frame = view.bounds
        //мабудь так робити повна лажа, але я розташувала таблицю під іншими об'єктами. Бо по нормальному через констрейни нижче задавала, не працює..
        myTable.frame = view.frame(forAlignmentRect: CGRect(x: 0, y: 150, width: 400, height: 500))
        myTable.backgroundColor = .black
    }
    // MARK: - private
    
    private func setup() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(titleWorldTime)
        view.addSubview(myTable) // передаю тут таблицю
    }

    private func setupStyle() {
        setupView()
        setupTitleAlarm()
    }
    
    private func setupLayout() {
        titleWorldTime.translatesAutoresizingMaskIntoConstraints = false
        myTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleWorldTime.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleWorldTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //тут також прописала таблицю, що має бути за кнопкою
            myTable.topAnchor.constraint(equalTo: titleWorldTime.bottomAnchor, constant: 10),
            myTable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupTitleAlarm() {
        titleWorldTime.text = "Час у світі"
        titleWorldTime.textColor = .white
        titleWorldTime.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    }
}

extension WorldTimeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: WorldTimeViewCell.identifier) as? WorldTimeViewCell else {
            return UITableViewCell() }
        
        let time = timeArray[indexPath.row]
        let status = statusArray[indexPath.row]
        let city = cityArray[indexPath.row]
        cell.configure(time: time, status: status, city: city)
        
        return cell
        
    }
}
