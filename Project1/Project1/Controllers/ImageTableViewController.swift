//
//  ViewController.swift
//  Project1
//
//  Created by Mobile2you on 25/12/21.
//

import UIKit

class ImageTableViewController: UIViewController {
    
    var pictures = [String]()
    
    var imageTableView: ImageTableView = {
        let table = ImageTableView()
        return table
    }()
    
    override func loadView() {
        self.view = imageTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loadImages()
        
        imageTableView.configTableViewProtocols(delegate: self, dataSource: self)
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareButtonTapped))
    }
    
    @objc func shareButtonTapped() {
        print("App compartilhado!")
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
    }
}

extension ImageTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ImageDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ImageDetailTableViewCell.identifier, for: indexPath) as? ImageDetailTableViewCell
        cell?.setupCell(content: pictures[indexPath.row])
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
}

extension ImageTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FullImageViewController()
        let parameter = indexPath.row

        vc.setupImage(pictures[parameter])
        vc.setupTitle(cellNumber: parameter, picturesList: pictures)

        navigationController?.pushViewController(vc, animated: true)
    }
}
