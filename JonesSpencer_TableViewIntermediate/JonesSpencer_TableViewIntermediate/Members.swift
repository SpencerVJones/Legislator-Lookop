//  Members.swift
//  JonesSpencer_TableViewIntermediate
//  Created by Spencer Jones on 4/20/24.

import Foundation

class Members {
    // Storred Properties
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    var party: String
    let state: String
    
    // Computed properies
    // Property to combine first and last name as fullName
    var fullName : String {
        let name = "\(firstName) \(lastName)"
        return name
    }
    
    // Prperty to combine party and state
    var formattedpartyState: String {
        let partyState = "\(party)-\(state)"
        return partyState
    }
    
    // Property to format party
    var formattedParty: String {
        var partyString = ""
        if party == "D" {
            partyString += "Democrat"
        }
        if party == "R" {
            partyString += "Republican"
        }
        if party == "I" {
            partyString += "Independent"
        }
        return partyString
    }
    
    // Initalizer
    init(id: String, title: String, firstName: String, lastName: String, party: String, state: String) {
        self.id = id
        self.title = title
        self.firstName = firstName
        self.lastName = lastName
        self.party = party
        self.state = state
    }
}
