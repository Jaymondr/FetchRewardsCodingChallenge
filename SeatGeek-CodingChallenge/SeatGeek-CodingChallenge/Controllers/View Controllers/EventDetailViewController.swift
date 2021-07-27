//
//  EventDetailViewController.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/20/21.
//

import UIKit
import MapKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var getTicketsButton: UIButton!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var mapsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        checkFavStatus()

    }
        
    //MARK: - Actions
    @IBAction func mapsButtonTapped(_ sender: Any) {
        guard let event = event else {return}
        
        let coordinate = event.venue.coordinates
        
        let areaLat = coordinate.lat
        let areaLon = coordinate.lon
        let area = "\(areaLat),\(areaLon)"
        let mapsURL = "http://maps.apple.com/?q="
        let finalURL = "\(mapsURL)\(area)"
        
        if (UIApplication.shared.canOpenURL(URL(string:"http://maps.apple.com")!)) {
            UIApplication.shared.open(URL(string: "\(finalURL)")!)
            print(finalURL)
            
        } else {
            NSLog("Can't use Apple Maps");
        }

        
    }
    
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
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        guard let event = event else {return}
        
        if Favorites.shared.contains(event) {
            likeButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            Favorites.shared.remove(event)

        } else {
            Favorites.shared.add(event)
            likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
            }
    
    
    
    
    //MARK: - Properties
    
    var event: EventsData?
    var liked: Bool = false
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
        mapsButton.layer.cornerRadius = 10
    }
    
    func checkFavStatus() {
        guard let event = event else {return}
        EventController.shared.loadFromPersistenceStore()
        if Favorites.shared.contains(event) {
            likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    
} //End of class


