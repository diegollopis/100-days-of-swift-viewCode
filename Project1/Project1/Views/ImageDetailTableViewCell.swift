//
//  ImageDetailTableViewCell.swift
//  Project1
//
//  Created by Mobile2you on 26/12/21.
//

import UIKit

class ImageDetailTableViewCell: UITableViewCell {
    
    static let identifier = "ImageDetailTableViewCell"
    
    lazy var descriptionCell: ImageDetailView = {
        let descriptionCell = ImageDetailView()
        return descriptionCell
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(content: String) {
        descriptionCell.title.text = content
        descriptionCell.image.image = UIImage(named: content)
    }
}

extension ImageDetailTableViewCell: ViewCode {
    
    func configView() {
        contentView.addSubview(descriptionCell)
    }
    
    func configConstraints() {
        descriptionCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
