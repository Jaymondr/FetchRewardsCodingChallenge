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
    let date_tbd: Bool
    let datetime_utc: String
    let venue: Venue
    let performers: [Performers]
}

struct Venue: Codable {
    let name: String
    let address: String
    let display_location: String
}
struct Performers: Codable {
    let image: String
//    let images: ThirdTopLevelObject
}
//
//struct ThirdTopLevelObject: Codable {
//    let huge: String
//}



