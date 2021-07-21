//
//  EventListTableViewController.swift
//  SeatGeek-CodingChallenge
//
//  Created by Jaymond Richardson on 7/19/21.
//

import UIKit

class EventListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        updateTableView()
        searchBar.delegate = self

    }
    //MARK: - Properties
    var events: [EventsData] = []
    var event: EventsData?

    
    //MARK: - Functions
    //searchTerm: String() insert after testing
//    func updateTableView() {
//        EventController.fetchEvents() { (result) in //JWR searchTerm string?
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let events):
//                    self.events = events
//                    self.tableView.reloadData()
//                case .failure(let error):
//                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//
//                }
//            }
//        }
//    }
//
    
    
    
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
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? EventDetailViewController else {return}
            let event = events[indexPath.row]
            destinationVC.event = event
        }


    }
}
extension EventListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text,
              !searchTerm.isEmpty else {return}
        EventController.fetchEvents(searchTerm: searchTerm.lowercased()) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let event):
                    self.events = event //New SOT
                    self.tableView.reloadData() //updating the table view after updating the source of truth
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }
}
