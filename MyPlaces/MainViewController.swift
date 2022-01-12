//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 11.01.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    var places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil {
            cell.imageRestaurant.image = UIImage(named: place.restaurantImage!)
        } else {
            cell.imageRestaurant.image = place.image
        }
        

        cell.imageRestaurant.layer.cornerRadius = cell.widthOfImageRestaurant.constant / 2
        cell.imageRestaurant.clipsToBounds = true
        
        return cell
    }
    
    
    // MARK: - Navigation

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
    
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
        
    }
}
