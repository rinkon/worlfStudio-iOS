//
//  ViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 10/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var quesitonireView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var frame = collectionView.frame
        frame.size.width = self.view.frame.width
        collectionView.frame = frame
        
        Utilities.addGradientToTopBar(theView: navView)
        
        quesitonireView.layer.cornerRadius = 26
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseId", for: indexPath) as! CustomCollectionViewCell
        cell.contentBackgroundView.layer.cornerRadius = 20
        cell.contentImageView.image = UIImage(named: "\(Constants.homePageItems[indexPath.row]).png")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            performSegue(withIdentifier: "toEventOverview", sender: self)
        case 1:
            performSegue(withIdentifier: "toNews", sender: self)
        case 2:
            performSegue(withIdentifier: "toShoplist", sender: self)
        case 4:
            performSegue(withIdentifier: "toPreRegistration", sender: self)
        case 5:
            performSegue(withIdentifier: "toBoothMap", sender: self)
        case 6:
            performSegue(withIdentifier: "toSeminarSchedule", sender: self)
        case 8:
            performSegue(withIdentifier: "toFavorite", sender: self)
        default:
            print("development ongoing")
        }
        
        
    }
    @IBAction func questionireButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toQuestionire", sender: nil)
    }
    


}

