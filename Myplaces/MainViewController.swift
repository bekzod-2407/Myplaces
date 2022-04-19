//
//  MainViewController.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import UIKit

class MainViewController: UITableViewController {
    
    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections sections in tableView (default 1)
    //        return 1
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        // get struct property
        cell.nameLabel.text = places[indexPath.row].name     // indexPath.row => index of arr
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image) // get struct property
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.layer.cornerRadius  = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true // obrezka img soglasno radiusu ugla
        return cell
    }
    

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func canselAction(_ segue: UIStoryboardSegue){} //for storyboard segue 
}
