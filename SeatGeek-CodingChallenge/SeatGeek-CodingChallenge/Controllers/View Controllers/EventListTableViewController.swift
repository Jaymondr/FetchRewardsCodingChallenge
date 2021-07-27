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
        Favorites.shared.loadFromPersistenceStore()
        searchBar.delegate = self
        hideKeyboard()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        Favorites.shared.loadFromPersistenceStore()
        self.tableView.reloadData()
    }
    //MARK: - Properties
    var events: [EventsData] = []

    //MARK: - Functions
    func updateViews() {
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "background")
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        self.view.addGestureRecognizer(tap)
        
        if !searchBar.searchTextField.isFirstResponder {
            tap.cancelsTouchesInView = false
        }
    }
    
    @objc func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
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
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? EventDetailViewController else {return}
            let event = events[indexPath.row]
            destinationVC.event = event
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
} //End of class

//MARK: - Extensions
extension EventListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
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
        self.searchBar.backgroundColor = UIColor(named: "background")
    }
} //End of extension

