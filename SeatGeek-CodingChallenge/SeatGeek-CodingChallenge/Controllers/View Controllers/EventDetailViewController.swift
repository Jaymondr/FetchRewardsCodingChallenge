//
//  EventDetailViewController.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/20/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var getTicketsButton: UIButton!
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
    
    @IBAction func getTicketsButtonTapped(_ sender: Any) {
        
        if let url = URL(string: event?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
    
    
    //MARK: - Properties
    
    var event: EventsData?
    
    //MARK: - Functions
    func updateViews() {
        guard let event = event else {return}
        EventController.fetchEventImage(for: event) { result in
            DispatchQueue.main.async {
                
                switch result {
                
                case .success(let image):
                    self.eventImageView.image = image
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: event.date)

        eventTitleLabel.text = event.title
        eventDateLabel.text = date?.formatToString()
        eventLocationLabel.text = event.venue.location
        getTicketsButton.layer.cornerRadius = 10
        eventImageView.layer.cornerRadius = 10
    }
} //End of class


