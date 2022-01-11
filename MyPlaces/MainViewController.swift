//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 11.01.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    let restaurantNames = ["Burger King", "McDonalds", "KFC", "Сушкофф",
                      "Китайская столовая", "Белый рынок", "Dodo Pizza"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        
        cell.imageRestaurant.image = UIImage(named: restaurantNames[indexPath.row])
        cell.imageRestaurant.layer.cornerRadius = cell.widthOfImageRestaurant.constant / 2
        cell.imageRestaurant.clipsToBounds = true
        
        return cell
    }

    // MARK: - Table View Delegate
    
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
