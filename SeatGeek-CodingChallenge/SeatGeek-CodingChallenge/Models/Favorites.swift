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
    
    private var favorites: [Int] = []
    
    init() {
        self.events = []
    }
    
    func contains(_ event: EventsData) -> Bool {
        favorites.contains(event.id)
    }
    
    func add(_ event: EventsData) {
        objectWillChange.send()
        events.insert(event.id)
        save(eventID: event.id)
    }
    
    func remove(_ event: EventsData) {
        objectWillChange.send()
        events.remove(event.id)
        save(eventID: event.id)
    }
        
    func save(eventID: Int) {
        Favorites.shared.saveToPersistenceStore()
    }
    
    //MARK: - Persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("SeatGeek-CodingChallenge.json")
        print(fileURL)
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
            favorites = try JSONDecoder().decode([Int].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
} //End of class
