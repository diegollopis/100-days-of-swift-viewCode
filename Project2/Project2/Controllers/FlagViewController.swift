//
//  ViewController.swift
//  Project2
//
//  Created by Mobile2you on 26/12/21.
//

import UIKit

class FlagViewController: UIViewController {
    
    var score = 0
    var round = 1
    
    lazy var content: FlagGameView = {
        let content = FlagGameView()
        return content
    }()
    
    override func loadView() {
        view = content
    }
    
    func updateInfoBar() {
        title = content.randomFlags.randomElement()?.capitalized
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: \(score)")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Round: \(round)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.delegate = self
        view.backgroundColor = .systemGray5
        updateInfoBar()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in self.updateGameScreen()
        }))
        present(alert, animated: true)
    }
    
    func updateGameScreen() {
        self.content.randomFlags.removeAll()
        
        var i = 0
        while i < 3 {
            guard let flag = self.content.flags.randomElement() else { return }
            if !self.content.randomFlags.contains(flag) {
                self.content.randomFlags.append(flag)
                self.content.flagButtons[i].setTitle(self.content.randomFlags[i], for: .normal)
                self.content.flagButtons[i].setImage(UIImage(named: self.content.randomFlags[i]), for: .normal)
                i += 1
            }
        }
        updateInfoBar()
    }
}

extension FlagViewController: FlagButtonProtocol {
    
    func flagButtonAction(_ sender: UIButton) {
        guard let flagTitle = sender.title(for: .normal)?.capitalized else { return }
        
        if flagTitle == title {
            score += 1
            showAlert(title: "Congratulations!", message: "That's the correct flag!")
        } else {
            showAlert(title: "Incorrect!", message: "That's the flag of \(flagTitle)!")
        }
        round += 1
    }
    
    func resetButtonAction() {
        round = 1
        score = 0
        updateInfoBar()
        updateGameScreen()
    }
}
