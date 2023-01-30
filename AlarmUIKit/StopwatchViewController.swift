//
//  TimerViewController.swift
//  AlarmUIKit
//
//  Created by Алина Власенко on 30.01.2023.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    var time = Timer()
    var seconds = 60
    var isStartTime = false
    var resumedTapped = false
//    var progressTime = 236
//    var isRunning = false
    
    private lazy var timerLabel = UILabel()
    private lazy var startButton = UIButton()
    private lazy var stopButton = UIButton()
    private lazy var resetButton = UIButton()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        stopButton.isEnabled = false
        startTime()
        
        func didTapPause(_ sender: UIButton) {
                if resumedTapped == false {
                    time.invalidate()
                    resumedTapped = true
                    stopButton.setTitle("Resume", for: .normal)
                } else {
                    startTime()
                    resumedTapped = false
                    stopButton.setTitle("Pause", for: .normal)
                }
            }
        
        func didTapStart(_ sender: UIButton) {
                if isStartTime == false {
                    startTime()
                    startButton.isEnabled = false
                }else {
                    startTime()
                    startButton.isEnabled = true
                }
            }
            
        func didTapReset(_ sender: UIButton) {
                time.invalidate()
                seconds = 0
                timerLabel.text = timeString(time: TimeInterval(seconds))
                isStartTime = false
                stopButton.isEnabled = false
                startButton.isEnabled = true
            }
            
    }
    
    func startTime() {
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isStartTime = true
            stopButton.isEnabled = true
        }
        
        @objc func updateTimer() {
            if seconds < 0 {
                time.invalidate()
            } else {
                seconds += 1
                timerLabel.text = timeString(time: TimeInterval(seconds))
            }
        }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours,minutes,seconds)
    }
    

    // MARK: - private
    
    private func setup() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        view.addSubview(resetButton)
    }

    private func setupStyle() {
        setupView()
        setupTimerLabel()
        setupStartButton()
        setupStopButton()
        setupResetButton()
    }
    
    private func setupLayout() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            startButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 133),
            startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 80),
            startButton.widthAnchor.constraint(equalToConstant: 80),
            
            stopButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 133),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.heightAnchor.constraint(equalToConstant: 80),
            stopButton.widthAnchor.constraint(equalToConstant: 80),
            
            resetButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 130),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resetButton.heightAnchor.constraint(equalToConstant: 80),
            resetButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupTimerLabel() {
        timerLabel.text = "00:00,00"
        timerLabel.textColor = .white
        timerLabel.font = UIFont.systemFont(ofSize: 100, weight: .thin)
    }
    
    private func setupStartButton() {
        startButton.setTitle("Старт", for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
        startButton.backgroundColor = UIColor(red: 6.0 / 255.0, green: 104.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
        startButton.setTitleColor(.green, for: .normal) //чомусь не працює колір
        startButton.layer.cornerRadius = 40
        startButton.layer.borderColor = .init(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)
        startButton.layer.borderWidth = 2
        //setAlarmButton.titleLabel?.textCase.uppercase
        //startButton.addTarget(self, action: #selector (myStartButtonClicked), for: .touchUpInside)
    }
    
    private func setupStopButton() {
        stopButton.setTitle("Стоп", for: .normal)
        stopButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
        startButton.backgroundColor = UIColor(red: 6.0 / 255.0, green: 104.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
        stopButton.setTitleColor(.green, for: .normal) //чомусь не працює колір
        stopButton.layer.cornerRadius = 40
        stopButton.layer.borderColor = .init(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)
        stopButton.layer.borderWidth = 2
        //setAlarmButton.titleLabel?.textCase.uppercase
        //stopButton.addTarget(self, action: #selector (myStopButtonClicked), for: .touchUpInside)
    }
    
    private func setupResetButton() {
        resetButton.setTitle("На нуль", for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
        resetButton.backgroundColor = .darkGray
        resetButton.layer.borderColor = .init(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)
        resetButton.layer.borderWidth = 2
        resetButton.setTitleColor(.white, for: .normal) //чомусь не працює колір
        resetButton.layer.cornerRadius = 40
        //setAlarmButton.titleLabel?.textCase.uppercase
        //resetButton.addTarget(self, action: #selector (myResetButtonClicked), for: .touchUpInside)
    }
    
    
    
//    @objc private func myStartButtonClicked() {
//        print("MyStartButton clicked")
////        setupStopButton()
////        if isRunning{
////            timer.invalidate()
////        } else {
////            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
////                self.progressTime += 1
////            })
////            //startStopButton.setTitle("Стоп", for: .normal)
////        }
//    }
    
//    @objc private func myStopButtonClicked() {
//        print("MyStopButton clicked")
////        setupStopButton()
////        if isRunning{
////            timer.invalidate()
////        } else {
////            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
////                self.progressTime += 1
////            })
////            //startStopButton.setTitle("Стоп", for: .normal)
////        }
//    }
//
//    @objc private func myResetButtonClicked() {
//        print("MyResetButton clicked")
//        //progressTime = 0
//    }
        
    
    
    
}
