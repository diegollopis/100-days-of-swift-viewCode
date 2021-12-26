//
//  ImageDetailView.swift
//  Project1
//
//  Created by Mobile2you on 25/12/21.
//

import UIKit

class ImageDetailView: UIView {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = .black
        return title
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

extension ImageDetailView: ViewCode {
    
    func configView() {
        addSubview(image)
        addSubview(title)
    }
    
    func configConstraints() {
        
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(10)
            make.height.width.equalTo(120)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(image.snp.centerY)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }
}
