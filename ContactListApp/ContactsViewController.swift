//
//  ContactsViewController.swift
//  ContactListApp
//
//  Created by Aisha Karzhauova on 18.10.2024.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var table: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var addContactButton: UIBarButtonItem!
    
    
    var contacts: [Contact] = []
    var filteredContacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
    
        
        table.dataSource = self
        table.delegate = self
        searchBar.delegate = self
        loadContacts()
        filteredContacts = contacts

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addContactSegue" {
            let addVC = segue.destination as! AddContactsViewController
            addVC.completion = { [weak self] contact in
                self?.contacts.append(contact)
                self?.filteredContacts = self?.contacts ?? []
                self?.table.reloadData()
                self?.saveContacts()
            }
        }
        
//        if segue.identifier == "showContactDetailSegue" {
//            if let indexPath = sender as? IndexPath {
//                let selectedContact = filteredContacts[indexPath.row]
//                let detailVC = segue.destination as! ContactDetailsViewController
//                detailVC.contact = selectedContact
//            }
//        }
        
        if segue.identifier == "showContactDetailSegue" {
            let detailVC = segue.destination as! ContactDetailsViewController
            
            // Get the index path of the selected row
            if let indexPath = table.indexPathForSelectedRow {
                    // Get the selected contact
                let selectedContact = filteredContacts[indexPath.row]
                    // Pass the selected contact to the detail view controller
                detailVC.contact = selectedContact
            }
        }
        
    }
    
    
//    @IBSegueAction func showContactDetails(_ coder: NSCoder, sender: Any?) -> ContactDetailsViewController? {
//        if let indexPath = table.indexPathForSelectedRow {
//            let detailVC = ContactDetailsViewController(coder: coder)
//            let selectedContact = filteredContacts[indexPath.row]
//            detailVC?.contact = selectedContact
//            return detailVC
//        }
//        
//        return nil
//
//    }
    
        
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContacts.count
    }
        
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = filteredContacts[indexPath.row]
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel?.text = contact.company
        return cell
    }
    
    func saveContacts() {
        if let encodedData = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(encodedData, forKey: "savedContacts")
        }
    }
    
    func loadContacts() {
        if let savedData = UserDefaults.standard.data(forKey: "savedContacts") {
            if let decodedContacts = try? JSONDecoder().decode([Contact].self, from: savedData){
                contacts = decodedContacts
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredContacts = contacts
        } else {
            filteredContacts = contacts.filter { contact in
                contact.firstName.lowercased().contains(searchText.lowercased()) ||
                contact.lastName.lowercased().contains(searchText.lowercased()) ||
                contact.company.lowercased().contains(searchText.lowercased()) ||
                contact.phone.contains(searchText)
            }
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "showContactDetailSegue", sender: indexPath)
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
