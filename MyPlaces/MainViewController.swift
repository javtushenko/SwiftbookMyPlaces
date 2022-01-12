//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 11.01.2022.
//

import UIKit
import RealmSwift
import SwiftUI

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var places: Results<Place>!
    var ascendingSorting = true
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reversedSortingButton: UIBarButtonItem!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.isEmpty ? 0 : places.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageRestaurant.image = UIImage(data: place.imageData!)
        
        cell.imageRestaurant.layer.cornerRadius = cell.widthOfImageRestaurant.constant / 2
        cell.imageRestaurant.clipsToBounds = true
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let place = places[indexPath.row]
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let place = places[indexPath.row]
            let newPlaceVC = segue.destination as! NewPlaceViewController
            newPlaceVC.currentPlace = place
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.savePlace()
        tableView.reloadData()
    }
    
    // MARK: Sorting data
    
    @IBAction func sortSelection(_ sender: UISegmentedControl) {
        
        sorting()
    }
    
    @IBAction func reversedSoring(_ sender: UIBarButtonItem) {
        
        ascendingSorting.toggle()
        if ascendingSorting {
            reversedSortingButton.image = UIImage(named: "AZ")
        } else {
            reversedSortingButton.image = UIImage(named: "ZA")
        }
        
        sorting()
    }
    
    private func sorting() {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            places = places.sorted(byKeyPath: "date", ascending: ascendingSorting)
        } else {
            places = places.sorted(byKeyPath: "name", ascending: ascendingSorting)
        }
        
        tableView.reloadData()
    }
}

