//
//  WeatherTodayCell.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 04.02.21.
//

import UIKit

class WeatherTodayCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 15
    }

}
