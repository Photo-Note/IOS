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
    @IBOutlet weak var photoNameTextField: UITextField!
    
    var imagePicker: ImagePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
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
        photoNameTextField.resignFirstResponder()
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
         self.imagePicker.present(from: sender)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image,
            let note = photoNoteText.text,
            let name = photoNameTextField.text,
            !name.isEmpty else { return }
        
// photoNoteRep = PhotoRepresentation(name: name, partner: nil, note: note, collectionName: nil, photo: image.pngData()!)
        
        // Tons of errors and 'autofixes' with the commented out line above brought us to the following line of code.  Not sure any of it will work, but here we are.
//        photoNoteRep = PhotoRepresentation(photo: photoNote!.name!, name: photoNote?.name ?? nil, collectionName: "", partner: "", note: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToCollectionNameSegue" {
            guard let destinationVC = UIViewController() as? CollectionNameViewController else { return }
            
            destinationVC.photoNoteRep = self.photoNoteRep
        }
    }
    
}

extension AddPhotoViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
        
        updateViews()
    }
}
