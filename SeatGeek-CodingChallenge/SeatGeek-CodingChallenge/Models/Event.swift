//
//  Event.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//


import Foundation

/* URLS
 
 App Secret: 608482dbb513d8ffeba9aa4b94304537273696761303af26c7fcef80fce37dd3
 
 Client ID: client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy
 
Base URL: w/Client ID
 https://api.seatgeek.com/2/events?client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy
 

 */

struct EventTopLevelObject: Codable {
    let events: [EventsData]
}

struct EventsData: Codable {
    let title: String
    let dateTBD: Bool
    let date: String
    let venue: Venue
    let performers: [Performers]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case dateTBD = "date_tbd"
        case date = "datetime_utc"
        case venue = "venue"
        case performers = "performers"
    }
}

struct Venue: Codable {
    let name: String
    let address: String
    let location: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case location = "display_location"
    }
}
struct Performers: Codable {
    let image: String
}



