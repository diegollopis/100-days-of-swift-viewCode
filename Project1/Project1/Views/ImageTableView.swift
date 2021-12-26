//
//  ImageTableView.swift
//  Project1
//
//  Created by Mobile2you on 25/12/21.
//

import UIKit
import SnapKit

class ImageTableView: UIView {
    
    lazy var imageTableView: UITableView = {
        let table = UITableView()
        table.register(ImageDetailTableViewCell.self, forCellReuseIdentifier: ImageDetailTableViewCell.identifier)
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.imageTableView.delegate = delegate
        self.imageTableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension  ImageTableView: ViewCode {
    
    func configView() {
        addSubview(imageTableView)
    }
    
    func configConstraints() {
        
        imageTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide.snp.edges)
        }
    }
}
