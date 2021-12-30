//
//  FullFlagView.swift
//  Milestone1to3
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit

class FullFlagView: UIView {
    
    lazy var flag: UIImageView = {
        let flag = UIImageView()
        flag.contentMode = .scaleAspectFill
        flag.layer.borderColor = UIColor.black.cgColor
        flag.layer.borderWidth = 2
        flag.clipsToBounds = true
        return flag
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FullFlagView: ViewCode {
    
    func configView() {
        addSubview(flag)
    }
    
    func configConstraints() {
        flag.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing).inset(15)
            make.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }
}
