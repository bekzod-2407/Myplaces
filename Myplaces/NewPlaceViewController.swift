//
//  NewPlaceViewController.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    var newPlace: Place?
    
    var imageChanged = false
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
    //если false, элемент отображается частично затемненным, чтобы указать, что он отключен.
       placeName.addTarget(self, action: #selector(textFiledChanged), for: .editingChanged)
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    func saveNewPlace() {// user can add img,text...
        
        var image: UIImage?
        
        if imageChanged {
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
            
//        newPlace = Place
    }
    
//MARK: - tableviewDelegate
    // on click index cell   keyboard will hidden
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            let alert  = UIAlertController(title: nil,
                                           message: nil,
                                           preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                //chooiseImagePIcker sourse is a camera
                self.chooseImagePicker(sourse: .camera)
                //camera not work in simulator
            }
            camera.setValue(cameraIcon, forKey: "image")
            // key must be image  because we add a image
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
                //CATextLayerAlignmentMode can change text alignment
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                //chooiseImagePIcker sourse a photo gallery
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
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
    
    @objc private func textFiledChanged() {
        
        if placeName.text?.isEmpty == true  {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
}


//MARK: - Work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //UIImagePickerController.SourceType +> vizivaet interface dlya vibora foto
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
    //Queries whether the device supports picking media using the specified source type.
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true //can change or refactor image before upload
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
            imagePicker.delegate = self // NewPlaceViewController is delegate of imagePicker
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        placeImage.image = info[.editedImage] as? UIImage //An image edited by the user.
        placeImage.contentMode = .scaleAspectFill  // content zapolnin
        placeImage.clipsToBounds = true  // obrezka
        imageChanged = true
        dismiss(animated: true)  //obratno na pred. ViewController (zakrivaeimagepicker controller )
    }
}
