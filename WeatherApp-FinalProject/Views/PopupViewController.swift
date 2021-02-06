//
//  PopupViewController.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 06.02.21.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var addButton: AddButton!
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        popupView.layer.cornerRadius = 15
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeView(_:))))
        addButton.addTarget(self, action: #selector(removeView(_:)), for: .touchUpInside)
    }
    
    @objc func removeView(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
