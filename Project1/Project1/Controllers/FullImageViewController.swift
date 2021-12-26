//
//  FullImageViewController.swift
//  Project1
//
//  Created by Mobile2you on 26/12/21.
//

import UIKit

class FullImageViewController: UIViewController {
    
    let imageView: FullImageView = {
        let image = FullImageView()
        return image
    }()
    
    override func loadView() {
        self.view = imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupImage(_ imageName: String) {
        imageView.imageView.image = UIImage(named: imageName)
    }
    
    func setupTitle(cellNumber: Int, picturesList: [String]) {
        self.title = "Picture \(cellNumber + 1) of \(picturesList.count)"
    }
}
