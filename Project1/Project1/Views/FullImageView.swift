//
//  FullImageView.swift
//  Project1
//
//  Created by Mobile2you on 26/12/21.
//

import UIKit

class FullImageView: UIView {
        
    lazy var fullImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
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

extension FullImageView: ViewCode {
    
    func configView() {
        addSubview(fullImage)
    }
    
    func configConstraints() {
        fullImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
