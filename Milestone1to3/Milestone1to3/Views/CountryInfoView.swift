//
//  FlagInfoView.swift
//  Milestone1to3
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit

class CountryInfoView: UIView {
    
    lazy var flag: UIImageView = {
        let flag = UIImageView()
        flag.contentMode = .scaleToFill
        flag.clipsToBounds = true
        flag.layer.borderColor = UIColor.black.cgColor
        flag.layer.borderWidth = 2
        return flag
    }()
    
    lazy var name: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 20)
        return name
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

extension CountryInfoView: ViewCode {
    
    func configView() {
        addSubview(flag)
        addSubview(name)
    }
    
    func configConstraints() {
        flag.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(20)
            make.width.equalTo(120)
            make.height.equalTo(80)
            
        }
        
        name.snp.makeConstraints { make in
            make.centerY.equalTo(flag.snp.centerY)
            make.leading.equalTo(flag.snp.trailing).offset(20)
        }
    }
}
