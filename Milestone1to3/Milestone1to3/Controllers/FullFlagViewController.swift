//
//  FullFlagViewController.swift
//  Milestone1to3
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit

class FullFlagViewController: UIViewController {
    
    lazy var fullFlagView: FullFlagView = {
        let flag = FullFlagView()
        return flag
    }()
    
    override func loadView() {
        view = fullFlagView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionButtonTapped))
    }
    
    @objc func actionButtonTapped() {
        guard let image = fullFlagView.flag.image?.jpegData(compressionQuality: 0.8) else { return }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func configView(image: String) {
        title = image.capitalized
        fullFlagView.flag.image = UIImage(named: image)
    }
}
