//
//  Favorites.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/22/21.
//

import Foundation


class Favorites: ObservableObject {
    private var events: Set<Int>
        
    static let shared = Favorites()
    
    init() {
        
        self.events = []
    }
    
    func contains(_ event: EventsData) -> Bool {
        events.contains(event.id)
    }
    
    func add(_ event: EventsData) {
        objectWillChange.send()
        events.insert(event.id)
        save()
    }
    
    func remove(_ event: EventsData) {
        objectWillChange.send()
        events.remove(event.id)
        save()
    }
        
    func save() {
        EventController.shared.saveToPersistenceStore()
    }
}
