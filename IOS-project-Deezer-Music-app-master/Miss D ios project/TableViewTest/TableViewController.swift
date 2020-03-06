//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Sravan Nallala on 28/02/2020.
//  Copyright © 2020 fr.EpitaTableViewTest. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiService = APIService()
    var array: [Album]?
    var selectedFilm : Album?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        apiService.fetchUsers(completionHandler: reloadTable(users:))
    }
    
        
    
    func reloadTable(users: [Album]) {
        array = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        detailViewController.film = selectedFilm
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        guard let user = array? [indexPath.row] else
        {
            return UITableViewCell()
        }
        
        
         
        cell.titleLabel.text = "\(user.title .uppercased() ?? "Test Title")"
        cell.albumLable.text = user.label
        cell.setImageFor(urlString: user.cover_medium ?? "")
       // cell.emailLabel.text = user.release_date
           
        return cell
        
        
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let array = array else {
            return indexPath}
        selectedFilm = array[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
