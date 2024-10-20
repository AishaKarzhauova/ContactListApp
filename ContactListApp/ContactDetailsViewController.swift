//
//  ContactDetailsViewController.swift
//  ContactListApp
//
//  Created by Aisha Karzhauova on 20.10.2024.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let contact = contact {
            firstNameLabel.text = contact.firstName.isEmpty ? "N/A" : contact.firstName
            lastNameLabel.text = contact.lastName.isEmpty ? "N/A" : contact.lastName
            companyLabel.text = contact.company.isEmpty ? "No Company" : contact.company
            phoneLabel.text = contact.phone.isEmpty ? "No Phone" : contact.phone
        }
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
