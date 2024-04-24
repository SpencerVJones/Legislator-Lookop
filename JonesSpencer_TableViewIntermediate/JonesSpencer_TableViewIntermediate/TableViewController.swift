//  TableViewController.swift
//  JonesSpencer_TableViewIntermediate
//  Created by Spencer Jones on 4/20/24.

import UIKit

class TableViewController: UITableViewController {
    
    // Data array to catch inital download
    var members = [Members]()
    
    // Containers to hold members filtered by party
    var filteredMembers = [[Members](), [Members](), [Members]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate
        tableView.delegate = self
        
        // Call downloadJson function
        downloadJSON(atURL: "https://api.propublica.org/congress/v1/116/senate/members.json")
        downloadJSON(atURL: "https://api.propublica.org/congress/v1/116/house/members.json")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // 3 Sections
    }
    
    // Return number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMembers[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? MemberTableViewCell
        else { return tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)}
        
        // Configure cell
        let currentMember = filteredMembers[indexPath.section][indexPath.row]
        
        cell.nameLabel.text = currentMember.fullName
        cell.titleLabel.text = currentMember.title
        cell.partyStateLabel.text = currentMember.formattedpartyState
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Set background color of cell based on section
        switch indexPath.section {
        case 0:
            cell.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2) // Democrats
        case 1:
            cell.backgroundColor = UIColor.systemRed.withAlphaComponent(0.2) // Republicans
        case 2:
            cell.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.2) // Independents
        default:
            cell.backgroundColor = UIColor.white // Default
        }
    }
    
    // MARK: Header Methods
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return title for header in section
        switch section {
        case 0:
            return "Democrat"
        case 1:
            return "Republican"
        case 2:
            return "Independent"
        default:
            return "This should not happen!"
        }
    }
    
    // Set header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get index path of selected row
        if let indexPath = tableView.indexPathForSelectedRow {
            // Get member object to be sent to DetailViewController
            let memberToSend = filteredMembers[indexPath.section][indexPath.row]
            
            // Get reference to DetailViewController
            if let destination = segue.destination as? DetailViewController {
                // Set member property of DetailViewController to selected member object
                destination.member = memberToSend
            }
        }
    }
}
