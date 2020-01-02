//
//  AddPhotoViewController.swift
//  PhotoNote
//
//  Created by Brandi Bailey on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
         self.imagePicker.present(from: sender)
    }
}

extension AddPhotoViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}
