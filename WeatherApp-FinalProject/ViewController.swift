//
//  ViewController.swift
//  WeatherApp-FinalProject
//
//  Created by Matt Dolidze on 01.02.21.
//

import UIKit
import ScalingCarousel

protocol WeatherView: class{
    func UpdateUI()
}
class ViewController: UIViewController {

    @IBOutlet weak var CarouselView: ScalingCarouselView!
    
    private let weatherPresenter = WeatherPresenter.shared
    private let notificationManager = NotificationManager.shared
    

    @IBOutlet weak var addButton: AddButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CarouselView.delegate = self
        CarouselView.dataSource = self
        CarouselView.inset = 50
        CarouselView.register(UINib(nibName: "WeatherTodayCell", bundle: nil), forCellWithReuseIdentifier: "WeatherTodayCell")
        
        notificationManager.InjectView(view: self)
        weatherPresenter.injectView(weatherView: self)
        
        
        weatherPresenter.GetWeatherDataForCurrentDay()
        
        
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 40))
        label.font = UIFont.boldSystemFont(ofSize: 14)

        label.text = "Today"
        label.numberOfLines = 2
        label.textColor = .white
        label.sizeToFit()
        label.textAlignment = .center

        self.navigationItem.titleView = label
        

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        CarouselView.deviceRotated()
    }
    
    
    @IBAction func OnAddPressed(_ sender: Any) {
        performSegue(withIdentifier: "TodayToPopup", sender: self)
    }
}

extension ViewController : WeatherView {
    func UpdateUI() {
        print("UI Updated")
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherTodayCell", for: indexPath)
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        CarouselView.didScroll()
//        guard let index = CarouselView.currentCenterCellIndex?.row else { return }
        
    }
}
