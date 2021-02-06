//
//  AddButton.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 05.02.21.
//

import UIKit

class AddButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .clear
        setTitle("", for: .normal)
        setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        imageView?.tintColor = .white
    }
}
