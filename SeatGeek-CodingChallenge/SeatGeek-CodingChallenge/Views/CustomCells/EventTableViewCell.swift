//
//  EventTableViewCell.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    //MARK: - Outlets
    
    
    
    
    
    
    //MARK: - Properties
    var event: EventsData? {
        didSet {
            updateViews()
        }
    }

    //MARK: - Functions
    
    func updateViews() {
        guard let event = event else {return}
        
    }
    
    
    
    
}//End of class
