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
    
    var events: [Events] = []
        
    //MARK: - String Constants
    static let baseURL = URL(string: "https://api.seatgeek.com/2/events")
    static let clientKey = "client_id"
    static let idValue = "MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy"
    static let query = "q"
    
    static func fetchEvents(searchTerm: String, completion: @escaping (Result<[EventsData], EventError>) -> Void) {

        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let idQueryItem = URLQueryItem(name: clientKey, value: idValue)
        let eventSearchQuery = URLQueryItem(name: query, value: searchTerm)
        
        components?.queryItems = [idQueryItem, eventSearchQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
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
                let eventTopLevelObject = try JSONDecoder().decode(Events.self, from: data)

                completion(.success(eventTopLevelObject.events))
        
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchEventImage(for event: EventsData, completion: @escaping (Result<UIImage, EventError>) -> Void) {
        
        guard let url = event.performers.first!.image else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Image STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            
            completion(.success(image))
        }.resume()
    }
    //MARK: - Persistence
    // CSL: create, Save, Load
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("SeatGeek-CodingChallenge.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(events)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            
        }
    }
    
    func loadFromPersistenceStore () {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            events = try JSONDecoder().decode([Events].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}//End of class

