//
//  Event.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//


import Foundation

/* URLS
 
 Client ID: client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy
 
Base URL: w/Client ID
 https://api.seatgeek.com/2/events?client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy
 
 */

struct Events: Codable {
    var events: [EventsData] = []
}

struct EventsData: Codable {
    let id: Int
    let type: String
    var title: String = ""
    var dateTBD: Bool = false
    var date: String = ""
    var venue: Venue
    var performers: [Performers] = []
    var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case title = "title"
        case dateTBD = "date_tbd"
        case date = "datetime_local"
        case venue = "venue"
        case performers = "performers"
        case url = "url"
    }
}

struct Venue: Codable {
    let name: String
    let address: String
    let location: String
    let coordinates: Location
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case location = "display_location"
        case coordinates = "location"
    }
}

struct Performers: Codable {
    let image: URL?
}

struct Location: Codable {
    let lat: Float
    let lon: Float
}
