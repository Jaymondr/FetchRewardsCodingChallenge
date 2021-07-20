//
//  EventListTableViewController.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//

import UIKit

class EventListTableViewController: UITableViewController {
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTableView()


    }
    //MARK: - Properties
    var events: [EventsData] = []
    var event: EventsData?

    
    //MARK: - Functions
    //searchTerm: String() insert after testing
    func updateTableView() {
        EventController.fetchEvents() { (result) in //JWR searchTerm string?
            DispatchQueue.main.async {
                switch result {
                case .success(let events):
                    self.events = events
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")

                }
            }
        }
    }
    
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count //JWR possibly just chagne this to events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else { return UITableViewCell() }
        
        let event = events[indexPath.row]
        cell.event = event
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {



    }
}
extension EventListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //Reference pokedex for search functionality
        // drag out outlet
        //create empty array of events then save the liked event to that source
        //create like button switched default false
    }
}
