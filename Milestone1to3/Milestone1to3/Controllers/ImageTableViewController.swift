//
//  ViewController.swift
//  Milestone1to3
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit

class ImageTableViewController: UIViewController {
    
    let flags = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    lazy var tableView: ImageTableView = {
        let table = ImageTableView()
        return table
    }()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareButtonTapped))
        tableView.configTableViewProtocol(delegate: self, dataSource: self)
    }
    
    @objc func shareButtonTapped() {
        print("Share our app with your friends!")
    }
}

extension ImageTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CountryInfoViewCell? = tableView.dequeueReusableCell(withIdentifier: CountryInfoViewCell.identifier, for: indexPath) as? CountryInfoViewCell
        cell?.accessoryType = .disclosureIndicator
        cell?.configCountryInfo(content: flags[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}

extension ImageTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FullFlagViewController()
        vc.configView(image: flags[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

