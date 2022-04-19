//
//  MainViewController.swift
//  Myplaces
//
//  Created by user on 19/04/22.
//

import UIKit

class MainViewController: UITableViewController {
    
    
    let restorauntNames = [
        "Burger Heroes" , "Kitchen","Bonsai","Дастархан",
        "Индокитай","X.O","Балкан Гриль","Sherlock Holmes",
        "Speak Easy", "Morris Pub","Вкусные истории",
        "Классик","Love&Life","Шок","Бочка"
    ]
    
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
        return restorauntNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = restorauntNames[indexPath.row]// indexPath.row => index of arr
        cell.imageOfPlace.image = UIImage(named: restorauntNames[indexPath.row])
        cell.imageOfPlace.layer.cornerRadius  = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true // obrezka img soglasno radiusu ugla
        return cell
    }
    
//MARK: - tableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
