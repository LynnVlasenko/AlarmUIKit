//
//  ViewController.swift
//  AlarmUIKit
//
//  Created by Алина Власенко on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let timeArray = ["09:00", "14:55", "22:20", "09:23"]
    private let statusArray = ["Сигнал", "Сигнал", "Сигнал", "Сигнал"]

    private lazy var titleAlarm = UILabel()
    private lazy var subtitle = UILabel()
    private lazy var line = UIView()
    private lazy var dontSetAlarmLabel = UILabel()
    private lazy var setAlarmButton = UIButton()
    //зробила тут таблицю як і всі елементи lazy var
    private lazy var myTable: UITableView = {
        let table = UITableView()
        
        table.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        
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
        myTable.frame = view.frame(forAlignmentRect: CGRect(x: 10, y: 300, width: 400, height: 500))
        myTable.backgroundColor = .black
    }
    
    // MARK: - private
    
    private func setup() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(titleAlarm)
        view.addSubview(subtitle)
        view.addSubview(line)
        view.addSubview(dontSetAlarmLabel)
        view.addSubview(setAlarmButton)
        view.addSubview(myTable) // передаю тут таблицю
    }

    private func setupStyle() {
        setupView()
        setupTitleAlarm()
        setupSubtitle()
        setupLine()
        setupDontSetAlarmLabel()
        setupSetAlarmButton()
    }
    
    private func setupLayout() {
        titleAlarm.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        dontSetAlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        setAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        //додаю тут таблицю
        myTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleAlarm.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleAlarm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            subtitle.topAnchor.constraint(equalTo: titleAlarm.bottomAnchor, constant: 30),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            line.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 390),
            
            dontSetAlarmLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 20),
            dontSetAlarmLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            setAlarmButton.topAnchor.constraint(equalTo: dontSetAlarmLabel.bottomAnchor, constant: 5),
            setAlarmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setAlarmButton.heightAnchor.constraint(equalToConstant: 30),
            setAlarmButton.widthAnchor.constraint(equalToConstant: 140),
            
            //тут також прописала таблицю, що має бути за кнопкою
            myTable.topAnchor.constraint(equalTo: setAlarmButton.bottomAnchor, constant: 30),
            myTable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupTitleAlarm() {
        titleAlarm.text = "Будильник"
        titleAlarm.textColor = .white
        titleAlarm.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    }
    
    private func setupSubtitle() {
        subtitle.text = "Сон | Підйом"
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setupLine() {
        line.backgroundColor = .darkGray
    }
    
    private func setupDontSetAlarmLabel() {
        dontSetAlarmLabel.text = "Немає будильників"
        dontSetAlarmLabel.textColor = .darkGray
        dontSetAlarmLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func setupSetAlarmButton() {
        setAlarmButton.setTitle("НАЛАШТУВАННЯ", for: .normal)
        setAlarmButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        setAlarmButton.backgroundColor = .darkGray
        setAlarmButton.titleLabel?.textColor = .orange //чомусь не працює колір.
        setAlarmButton.layer.cornerRadius = 15
        //setAlarmButton.titleLabel?.textCase.uppercase
        setAlarmButton.addTarget(self, action: #selector (myButtonClicked), for: .touchUpInside)
    }
    
    @objc private func myButtonClicked() {
        print("MyButton clicked")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as? MyTableViewCell else {
            return UITableViewCell() }
        
        let time = timeArray[indexPath.row]
        let status = statusArray[indexPath.row]
        cell.configure(time: time, status: status)
        
        return cell
        
    }
}
