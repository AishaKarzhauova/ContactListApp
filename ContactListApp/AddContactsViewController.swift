//
//  AddContactsViewController.swift
//  ContactListApp
//
//  Created by Aisha Karzhauova on 18.10.2024.
//

import UIKit

class AddContactsViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var comp: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    
    var completion: ((Contact) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        print("Done button tapped")  // For debugging
        let firstName = firstName.text ?? ""
        let lastName = lastName.text ?? ""
        let company = comp.text ?? ""
        let phone = phoneNum.text ?? ""

        // Create a Contact object (even with empty fields)
        let contact = Contact(firstName: firstName, lastName: lastName, company: company, phone: phone)
        completion?(contact)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel button tapped")  // For debugging
        self.dismiss(animated: true, completion: nil)
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
