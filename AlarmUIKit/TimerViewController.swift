//
//  StopwatchViewController.swift
//  AlarmUIKit
//
//  Created by Алина Власенко on 30.01.2023.
//

import UIKit

class TimerViewController: UIViewController {
    private var timeArray = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"], ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"], ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]]
    private var num = 0
    
    private lazy var timePicker = UIPickerView()
    private lazy var startStopButton = UIButton()
    private lazy var resetButton = UIButton()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        timePicker.dataSource = self
        timePicker.delegate = self
        
    }

    // MARK: - private
    
    private func setup() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(timePicker)
        view.addSubview(startStopButton)
        view.addSubview(resetButton)
    }

    private func setupStyle() {
        setupView()
        setupTimePicker()
        setupStartStopButton()
        setupResetButton()
    }
    
    private func setupLayout() {
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startStopButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 87),
            startStopButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            startStopButton.heightAnchor.constraint(equalToConstant: 80),
            startStopButton.widthAnchor.constraint(equalToConstant: 80),
            
            resetButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 84),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resetButton.heightAnchor.constraint(equalToConstant: 80),
            resetButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupTimePicker() {
        //timerLabel.text = "00:00,00"
        timePicker.frame = CGRect(x: 10, y: 0, width: 200, height: 44)
        //timerLabel.font = UIFont.systemFont(ofSize: 100, weight: .thin)
    }
    
    private func setupStartStopButton() {
        startStopButton.setTitle("Пуск", for: .normal)
        startStopButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
        startStopButton.backgroundColor = UIColor(red: 6.0 / 255.0, green: 104.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
        startStopButton.setTitleColor(.green, for: .normal) //чомусь не працює колір
        startStopButton.layer.cornerRadius = 40
        startStopButton.layer.borderColor = .init(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)
        startStopButton.layer.borderWidth = 2
        //setAlarmButton.titleLabel?.textCase.uppercase
        startStopButton.addTarget(self, action: #selector (myStartStopButtonClicked), for: .touchUpInside)
    }
    
    private func setupResetButton() {
        resetButton.setTitle("Скинути", for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
        resetButton.backgroundColor = .darkGray
        resetButton.layer.borderColor = .init(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)
        resetButton.layer.borderWidth = 2
        resetButton.setTitleColor(.gray, for: .normal) //чомусь не працює колір
        resetButton.layer.cornerRadius = 40
        //setAlarmButton.titleLabel?.textCase.uppercase
        resetButton.addTarget(self, action: #selector (myResetButtonClicked), for: .touchUpInside)
    }
    
    @objc private func myStartStopButtonClicked() {
        print("MyStartStopButton clicked")
        //startStopButton.setTitle("Стоп", for: .normal)
        
    }
    
    @objc private func myResetButtonClicked() {
        print("MyResetButton clicked")
    }
}


extension TimerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = timeArray[component][row]
        return title
    }
}


//Розширення для роботи методу dataSource компонета UIPickerView()
extension TimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        timeArray.count //розумію, що тут треба рахувати кількості значень у вкладених масивах, але не можу зрозуміти як це вказати динамічно - помилки і все.. Навіть коли вказую певний індекс, помилка така сама як при (for in) Fatal error: Index out of range
        
//        for el in timeArray {
//            num = el.count
//        }
//        return num // виходить Fatal error: Index out of range
        //timeArray[index].count
    }
}
