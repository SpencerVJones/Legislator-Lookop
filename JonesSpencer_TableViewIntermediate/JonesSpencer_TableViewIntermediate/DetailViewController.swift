//  DetailViewController.swift
//  JonesSpencer_TableViewIntermediate
//  Created by Spencer Jones on 4/20/24.
//  Default profile image from https://www.freepik.com/
//  Congress member images from https://theunitedstates.io/


import UIKit

class DetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet var colorView: UIView!
    @IBOutlet var memberImageView: UIImageView!
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detailParty: UILabel!
    @IBOutlet var detailState: UILabel!
    
    // Property to recieve members object
    var member: Members!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Construct image URL using Id
        let imageUrlString = "https://theunitedstates.io/images/congress/225x275/\(member.id).jpg"
        
        // Check if URL is valid
        guard let imageUrl = URL(string: imageUrlString) else {
            print("Invalid image URL")
            return
        }
        
        // Create URLSession data task to download image
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            // Check for errors
            if error != nil { return }
            
            // Check if data received
            guard let imageData = data else { return }
            
            // Create UIImage from downloaded data
            if let image = UIImage(data: imageData) {
                // Update UI
                DispatchQueue.main.async {
                    self.memberImageView.image = image
                }
            }
        }
        // Start task
        task.resume()
        
        // Update UI
        if member != nil {
            detailTitle.text = "Title: \(member.title)"
            detailParty.text = "Party: \(member.formattedParty)"
            detailState.text = "State: \(member.state)"
            navigationItem.title = member.fullName
        }
        
        // Change the background color based on member party
        if member.party == "D" {
            colorView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        }
        
        if member.party == "R" {
            colorView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.2)
        }
        
        if member.party == "I" {
            colorView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.2)
        }
    }
}
