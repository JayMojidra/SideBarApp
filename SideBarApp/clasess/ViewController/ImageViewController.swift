//
//  ImageViewController.swift
//  SideBarApp
//
//  Created by R&W on 10/03/22.
//

import UIKit

class ImageViewController: UIViewController {
 
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var sideBarButton: UIBarButtonItem!
    //MARK: - Variable
    let homeButton: SideBarItem = SideBarItem(name: "Profile", image: "")
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            sideBarButton.target = self.revealViewController()
            sideBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        setprofilePictureLabel()
        genderTextField.delegate = self
    }
    func setprofilePictureLabel() {
        profilePictureImageView.layer.cornerRadius = 100
        profilePictureImageView.layer.masksToBounds = true
    }
    func setGenderOption() {
        let alert: UIAlertController = UIAlertController(title: "Gender", message: "Choose Your Gender", preferredStyle: .actionSheet)
        let maleButton: UIAlertAction = UIAlertAction(title: "Male", style: .default) { male in
            self.genderTextField.text = male.title
        }
        let femaleButton: UIAlertAction = UIAlertAction(title: "Female", style: .default) { female in
            self.genderTextField.text = female.title
        }
        let otherButton: UIAlertAction = UIAlertAction(title: "Other", style: .default) { other in
            self.genderTextField.text = other.title
        }
        alert.addAction(maleButton)
        alert.addAction(femaleButton)
        alert.addAction(otherButton)
        present(alert, animated: true, completion: nil)
    }

}
extension ImageViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        setGenderOption()
        return true
    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        genderTextField.text = ""
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        genderTextField.text = ""
        view.endEditing(true)
    }
}
