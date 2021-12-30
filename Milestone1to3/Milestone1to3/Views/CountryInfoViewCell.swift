//
//  CountryInfoViewCell.swift
//  Milestone1to3
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit

class CountryInfoViewCell: UITableViewCell {

    static var identifier = "CountryInfoViewCell"
    
    let countryInfoView: CountryInfoView = {
        let country = CountryInfoView()
        return country
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCountryInfo(content: String) {
        countryInfoView.flag.image = UIImage(named: content)
        countryInfoView.name.text = content.capitalized
    }
}

extension CountryInfoViewCell: ViewCode {
    
    func configView() {
        contentView.addSubview(countryInfoView)
    }
    
    func configConstraints() {
        countryInfoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
