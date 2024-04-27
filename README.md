# Legislator-Lookop
iOS application that fetches data from the ProPublica Congress API to populate the directory with information about current congressional members. Users can browse the directory, filter members by political party, and view detailed profiles for individual members.

## Features
- Displays a list of congressional members categorized by political party (Democrat, Republican, Independent).
- Provides detailed profiles for each member, including their full name, title, party affiliation, and state.
- Downloads and displays images of members using their unique IDs from the ProPublica Congress API.
- Allows users to filter members by political party to easily find members from a specific party.
- Utilizes UIKit for building the user interface and handling user interactions.
  
## Usage:
Upon launching the application, users are presented with a list of congressional members grouped by political party. They can tap on any member to view detailed information about them, including their image, title, party affiliation, and state. Users can also filter members by political party using the segmented control at the top of the screen.

## Demo 
![Demo](demo.gif)

## Technologies Used:
- **Swift**: The application is developed using the Swift programming language.
- **UIKit Framework**: Used for building the user interface of the application.
- **Foundation Framework**: Provides essential functionality for data management and networking.
- **Xcode**: Integrated development environment for iOS app development.
- **JSONSerialization**: Parsing JSON data retrieved from the ProPublica Congress API.
- **URLSession**: Making network requests to fetch data from the API.
  
## Contributing
Contributions are welcome! 

### You can contribute by:
-  Reporting bugs
-  Suggesting new features
-  Submitting pull requests to improve the codebase
