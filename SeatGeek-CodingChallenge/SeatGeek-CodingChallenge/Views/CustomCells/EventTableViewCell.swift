//
//  EventTableViewCell.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var eventTitleLable: UILabel!
    @IBOutlet weak var eventVenueLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    
    //MARK: - Properties
    var event: EventsData? {
        didSet {
            updateViews()
        }
    }

    //MARK: - Functions
    
    func updateViews() {
//        guard let event = event else {return}
        
    }
    
    
    
    
}//End of class
