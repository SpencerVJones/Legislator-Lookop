//  TVC_Extension.swift
//  JonesSpencer_TableViewIntermediate
//  Created by Spencer Jones on 4/20/24.
// All data from https://api.propublica.org/

import Foundation

extension TableViewController {
    
    func downloadJSON(atURL urlString: String) {
        // Create default configuration
        let config = URLSessionConfiguration.default
        // Create session
        let session = URLSession(configuration: config)
        // Validate URL to ensure it's not a broken link
        if let validURL = URL(string: urlString) {
            
            // Create request passing in vaildURL for header
            var request = URLRequest(url: validURL)
            // Set the header values
            request.setValue("KzWSogiU7zsc0ernjZuuHEBDYLSpExHELGn8KNVG", forHTTPHeaderField: "X-API-Key")
            // Type of Request
            request.httpMethod = "GET"
            
            // Create task to send request and downlad data from vaildURL
            let task = session.dataTask(with: request, completionHandler: { (opt_data, opt_response, opt_error) in
                
                // Bail Out on error
                if opt_error != nil { return }
                
                // Check the response, statusCode, and data
                guard let response = opt_response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let data = opt_data
                else { return }
                
                do {
                    // De-Serialize data object
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        
                        if let results = json["results"] as? [[String: Any]] {
                            // Iterate over each result object
                            for result in results {
                                if let mems = result["members"] as? [[String: Any]] {
                                    // Iterate over each mems object
                                    for mem in mems {
                                        // Extract information from mems object
                                        if let id = mem["id"] as? String,
                                           let title = mem["title"] as? String,
                                           let firstName = mem["first_name"] as? String,
                                           let lastName = mem["last_name"] as? String,
                                           let party = mem["party"] as? String,
                                           let state = mem["state"] as? String {
                                            
                                            // Map model object
                                            let newMember = Members(id: id, title: title, firstName: firstName, lastName: lastName, party: party, state: state)
                                            self.members.append(newMember)
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch { print(error.localizedDescription) }
                
                // Reload the Table View
                DispatchQueue.main.async {
                    // Reload Table View
                    self.tableView.reloadData()
                    // Call filtering function
                    self.filterMembersByParty()
                }
            })
            // Start task
            task.resume()
        }
    }
    
    
    func filterMembersByParty() {
        // Filter members by party
        filteredMembers[0] = members.filter({ $0.party == "D" })
        filteredMembers[1] = members.filter({ $0.party == "R" })
        filteredMembers[2] = members.filter({ $0.party == "I" })
        
        // Reload Table View
        tableView.reloadData()
    }
}
