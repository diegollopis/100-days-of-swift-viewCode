//
//  ContentView.swift
//  Project2
//
//  Created by Mobile2you on 27/12/21.
//

import UIKit

protocol FlagButtonProtocol: AnyObject {
    func flagButtonAction(_ sender: UIButton)
    func resetButtonAction()
}

class FlagGameView: UIView {
    
    weak var delegate: FlagButtonProtocol?
    
    var randomFlags = [String]()
    var flagButtons = [UIButton]()
    let flags:[String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle(("Reset"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(configResetButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configFlagButton(index: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(randomFlags[index], for: .normal)
        button.setImage(UIImage(named: randomFlags[index]), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5000, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(configFlagButtonAction), for: .touchUpInside)
        return button
    }
    
    @objc func configFlagButtonAction(_ sender: UIButton) {
        delegate?.flagButtonAction(sender)
    }
    
    @objc func configResetButtonAction() {
        delegate?.resetButtonAction()
    }
    
    func configFlagStackView() {
        var i = 0
        while i < 3 {
            guard let flag = flags.randomElement() else { return }
            
            if !randomFlags.contains(flag) {
                randomFlags.append(flag)
                let button = configFlagButton(index: i)
                flagButtons.append(button)
                stackView.addArrangedSubview(button)
                
                i += 1
            }
        }
    }
}

extension FlagGameView: ViewCode {
    
    func configView() {
        addSubview(stackView)
        configFlagStackView()
        addSubview(resetButton)
    }
    
    func configConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(50)
            make.trailing.equalTo(self.snp.trailing).inset(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(300)
        }
        
        resetButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
