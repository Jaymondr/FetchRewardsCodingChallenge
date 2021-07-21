//
//  DateFormatter.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/20/21.
//

import Foundation
extension Date {
    
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
    
}

//extension Date {
//    func formatDate(date: String) -> String {
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        let date = dateFormatter.date(from: "2017-01-09T11:00:00.000Z")
//        print("date: \(date)")
//        return date
//    }
//}
