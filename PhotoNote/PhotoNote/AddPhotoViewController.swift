//
//  AddPhotoViewController.swift
//  PhotoNote
//
//  Created by Brandi Bailey on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
    var photoNote: Photo?
    var photoNoteRep: PhotoRepresentation?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var photoNoteText: UITextView!
    @IBOutlet weak var dropFlipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var photoNameTextField: UITextField!
    
    var imagePicker: ImagePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
    }
    
    func updateViews() {
        
        if imageView != nil {
            addImageButton.setTitle("Change Image", for: .normal)
        } else {
            addImageButton.setTitle("Select Image", for: .normal)
        }
    }
    
    override func touchesBegan(_: Set<UITouch>, with: UIEvent?){
        photoNoteText.resignFirstResponder()
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
         self.imagePicker.present(from: sender)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image,
            let note = photoNoteText.text,
            let name = photoNameTextField.text,
            !name.isEmpty else { return }
        
        
        
        photoNoteRep = PhotoRepresentation(name: name, partner: nil, note: note, collectionName: nil, photo: image.pngData()!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    
}

extension AddPhotoViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
        
        updateViews()
    }
}
