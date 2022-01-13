//
//  CustomTableViewCell.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 11.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageRestaurant: UIImageView!
    @IBOutlet weak var widthOfImageRestaurant: NSLayoutConstraint!
    
    @IBOutlet var stars: [UIImageView]!
    
}
