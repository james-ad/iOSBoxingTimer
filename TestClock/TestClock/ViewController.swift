//
//  ViewController.swift
//  TestClock
//
//  Created by James Dunn on 2/3/21.
//

import UIKit

class ViewController: UIViewController {
    let playPauseButton = UIButton()
    let resetButton = UIButton()
    var timer = Timer()
    var timerLabel = UILabel()
    var timerCounting: Bool = false
    var seconds: Int = 60
    
    override func loadView() {
        super.loadView()
        view.translatesAutoresizingMaskIntoConstraints = false
        layoutButtons()
        layoutTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func pressPlayButton() {
        if !timerCounting {
            print("Play button pressed")
            timerCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        } else {
            timerCounting = false
            timer.invalidate()
        }
    }
    
    @objc func resetButtonPressed() {
        print("Stop button pressed")
        resetTimer()
    }
    
    private func layoutButtons() {
        let playPauseButton = UIButton()
        let resetButton = UIButton()
        
        playPauseButton.setImage(UIImage(named: "play-button-arrowhead.png"), for: .normal)
        resetButton.setImage(UIImage(named: "stop.png"), for: .normal)
        playPauseButton.addTarget(self, action: #selector(pressPlayButton), for: .touchDown)
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchDown)
        
        view.addSubview(playPauseButton)
        view.addSubview(resetButton)
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            playPauseButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3),
            playPauseButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.15),
            playPauseButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -80),
            playPauseButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.28),
            resetButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.14),
            resetButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -85),
            resetButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -50),
        ])
    }
    
    func layoutTimer() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.text = String(seconds)
        view.addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            timerLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.2),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func resetTimer() {
        timerCounting = false
        timer.invalidate()
        seconds = 60
        timerLabel.text = String(seconds)
    }
    
    @objc func runTimer() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = String(seconds)
        } else {
            resetTimer()
        }
    }
    
}

