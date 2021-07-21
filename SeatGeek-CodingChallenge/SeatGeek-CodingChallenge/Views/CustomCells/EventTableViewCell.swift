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
    
    var performer: Performers?

    //MARK: - Functions
    func updateViews() {
        guard let event = event else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: event.date)
        eventTitleLable.text = event.title
        eventVenueLabel.text = event.venue.name
        eventDateLabel.text = date?.formatToString()
    }
    
    override func prepareForReuse() {
        
        
    }
}//End of class
