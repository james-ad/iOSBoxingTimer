//
//  ViewController.swift
//  TestClock
//
//  Created by James Dunn on 2/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        view.translatesAutoresizingMaskIntoConstraints = false
        layoutButtons()
        layoutScrollView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressPlayButton(_ sender: UIButton) {
        print("Play button pressed")
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print("Stop button pressed")
    }
    
    private func layoutButtons() {
        let playPauseButton = UIButton()
        let resetButton = UIButton()
        
        playPauseButton.setImage(UIImage(named: "play-button-arrowhead.png"), for: .normal)
        resetButton.setImage(UIImage(named: "stop.png"), for: .normal)
        
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
    
    func layoutScrollView() {
        let scroller = UIScrollView()
        scroller.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroller)
        
        NSLayoutConstraint.activate([
            scroller.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            scroller.heightAnchor.constraint(equalToConstant: view.frame.height * 0.2),
            scroller.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

