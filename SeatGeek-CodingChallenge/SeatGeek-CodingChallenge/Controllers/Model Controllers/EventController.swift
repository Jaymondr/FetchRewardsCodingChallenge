//
//  EventController.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//


//let baseURL = URL(string: "https://api.seatgeek.com/2/events?")

import UIKit

class EventController {
    
    static let shared = EventController()
    
    let events: [EventsData] = []
    
    //MARK: - String Constants
    static let baseURL = URL(string: "https://api.seatgeek.com/2/")
    static let client_id = "&client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy"
//    static let performers = "performers"
//    static let venues = "venues"
    static let event = "event?"
    static let query = "q="
    static let imageURL = "https://seatgeek.com/images/performers-landscape/"
    //searchTerm: String, ** insert below after tests*8
    static func fetchEvents(completion: @escaping (Result<[EventsData], EventError>) -> Void) {
        
        //Construct URL
        let baseURLL = URL(string: "https://api.seatgeek.com/2/events/801255?client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy")
        
        guard let finalURL = baseURLL else {return completion(.failure(.invalidURL))}
        print("Final URL: \(finalURL)")
        //Data task
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            //Handle Error
            if let error = error { //if error exists then will return with error
                return completion(.failure(.thrownError(error)))
            }
            
            //Handle Response
            if let response = response as? HTTPURLResponse {
                print("POST STATUS CODE: \(response.statusCode)")
            }
            //Make sure we have data
            guard let data = data else {return completion(.failure(.noData))}
            
            //Decode Data
            do {
                let eventTopLevelObject = try JSONDecoder().decode(EventTopLevelObject.self, from: data)
                
                var arrayOfEvent: [EventsData] = []
                
                for eventData in eventTopLevelObject.events {
                    
                    arrayOfEvent.append(eventData)
                    print(eventData.title)
                    
                    for performer in eventData.performers {
                        print(performer.image)
                    }
                }
                completion(.success(arrayOfEvent))
        
            } catch {
                completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
}
