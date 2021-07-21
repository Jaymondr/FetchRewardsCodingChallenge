//
//  EventDetailViewController.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/20/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func seatGeekLink(_ sender: Any) {
        if let url = URL(string: "https://seatgeek.com") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
    
    //MARK: - Properties
    
    var event: EventsData?
    
    //MARK: - Functions
    func updateViews() {
        guard let event = event else {return}
        eventTitleLabel.text = event.title
        eventDateLabel.text = event.date
        eventLocationLabel.text = event.venue.location
    }
} //End of class


