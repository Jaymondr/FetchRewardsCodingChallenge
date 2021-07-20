//
//  SeatGeekEndpoint.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//

import Foundation

class SeatGeekEndpoint {
    
    static let shared = SeatGeekEndpoint()
    
    let baseURL = "https://api.seatgeek.com/2/events?"
    
    let client_id = "client_id=MjI1ODUzNDN8MTYyNjczMTU5NS40NTkyOTEy"
    
    var parameters: [URLQueryItem] = []
    
//    var url: URL? {
//        guard let url = URL(string: baseURL),
//              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {return nil}
//
//
//    }
    
    
    
}
