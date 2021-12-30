//
//  TableView.swift
//  Milestone1to3
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit

class ImageTableView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(CountryInfoViewCell.self, forCellReuseIdentifier: CountryInfoViewCell.identifier)
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableViewProtocol(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

extension ImageTableView: ViewCode {
    
    func configView() {
        addSubview(tableView)
    }
    
    func configConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

