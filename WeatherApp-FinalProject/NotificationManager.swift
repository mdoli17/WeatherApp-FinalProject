//
//  NotificationManager.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 05.02.21.
//

import UIKit

class NotificationManager {
    private static let instance = NotificationManager()
    public static var shared : NotificationManager { get { instance } }
    weak private var mainView : UIViewController?
    private init() {
        
    }
    
    public func InjectView(view: UIViewController) {
        mainView = view
    }
    
    public func PopupAddLocation() {
        let popup = UIAlertController(title: "Add location", message: "Enter details", preferredStyle: .alert)
        mainView?.present(popup, animated: true)
    }
}
