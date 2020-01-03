//
//  CollectionNameViewController.swift
//  PhotoNote
//
//  Created by Brandi Bailey on 1/3/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import UIKit

class CollectionNameViewController: UIViewController {
    
    var photoNoteRep: PhotoRepresentation?
    var photos: [PhotoRepresentation] = []
    
    @IBOutlet weak var collectionsTableView: UITableView!
    @IBOutlet weak var newCollectionNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newCollectionNameTextField.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_: Set<UITouch>, with: UIEvent?){
        newCollectionNameTextField.resignFirstResponder()
    }
    
    
    @IBAction func createNewCollection(_ sender: UIButton) {
        newCollectionNameTextField.isHidden = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CollectionNameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath) as?
            CollectionNameTableViewCell else { return UITableViewCell() }
        
        let photo = photos[indexPath.row]
        cell.textLabel?.text = photo.collectionName
        
        return cell
    }
}
