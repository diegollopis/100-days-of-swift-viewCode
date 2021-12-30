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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
    }
    
    @objc func shareButtonTapped() {
                
        guard let image = imageView.fullImage.image?.jpegData(compressionQuality: 0.8) else {
                print("No image found")
                return
            }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
    func setupImage(_ imageName: String) {
        imageView.fullImage.image = UIImage(named: imageName)
    }
    
    func setupTitle(cellNumber: Int, picturesList: [String]) {
        self.title = "Picture \(cellNumber + 1) of \(picturesList.count)"
    }
}
