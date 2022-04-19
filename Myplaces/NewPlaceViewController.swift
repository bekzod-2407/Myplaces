//
//  NewPlaceViewController.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//MARK: - tableviewDelegate
    // on click index cell   keyboard will hidden
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alert  = UIAlertController(title: nil,
                                           message: nil,
                                           preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                //chooiseImagePIcker sourse is a camera
                self.chooseImagePicker(sourse: .camera)
                //camera not work in simulator
            }
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                //chooiseImagePIcker sourse a photo gallery
                self.chooseImagePicker(sourse: .photoLibrary)

            }
            let cansel = UIAlertAction(title: "Cansel", style: .cancel) { _ in
                
            }
            alert.addAction(camera)
            alert.addAction(photo)
            alert.addAction(cansel)
            present(alert, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
}







//MARK: - textFieltDelegete
extension NewPlaceViewController: UITextFieldDelegate {
    // when we click a return or done btn  keyboard will hidden
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK: - Work with image

extension NewPlaceViewController {
    //UIImagePickerController.SourceType +> vizivaet interface dlya vibora foto
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
    //Queries whether the device supports picking media using the specified source type.
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true //can change or refactor image before upload
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
        
    }
}
