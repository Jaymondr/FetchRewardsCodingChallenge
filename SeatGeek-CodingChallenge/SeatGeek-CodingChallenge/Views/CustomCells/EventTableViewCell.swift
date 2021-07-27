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
    @IBOutlet weak var isFavoriteButton: UIButton!
    
    //MARK: - Properties
    var event: EventsData? {
        didSet {
            updateViews()
        }
    }
    
    var favorite: Favorites? {
        didSet {
            checkIsFavorited()
        }
    }
    
    var performer: Performers?

    //MARK: - Functions
    func checkIsFavorited() {
        guard let event = event else {return}
        if Favorites.shared.contains(event) {
            isFavoriteButton.isHidden = false
        
        } else {
            isFavoriteButton.isHidden = true
        }
    }
    func updateViews() {
        
        guard let event = event else {return}
        EventController.fetchEventImage(for: event) { result in
            DispatchQueue.main.async {
                if Favorites.shared.contains(event) {
                    self.isFavoriteButton.isHidden = false
                
                } else {
                    self.isFavoriteButton.isHidden = true
                }
                switch result {
                
                case .success(let image):
                    self.eventImageView.image = image
                    self.eventImageView.layer.cornerRadius = 10

                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: event.date)
        eventTitleLable.text = event.title
        eventVenueLabel.text = event.venue.name
        eventDateLabel.text = date?.formatToString()
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        eventVenueLabel.textColor = UIColor(named: "background")
    }
}//End of class



