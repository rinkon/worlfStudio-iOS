//
//  FavoriteViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 20/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class FavoriteViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var favoriteTableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        setupFooterView()
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                topConstraint.constant = 90
            default:
                print("")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteReuseId") as! FavoriteTableViewCell
        var xPosition: CGFloat = 0.0
        let widthUnit = tableView.frame.width/8
        let cellHeight = cell.frame.height
        
        cell.nameLabel.frame = CGRect(x: xPosition, y: 0, width: widthUnit*4, height: cellHeight)
        cell.nameLabel.layer.cornerRadius = 20
        cell.nameLabel.clipsToBounds = true
        xPosition += widthUnit*4
        cell.boothNoLabel.frame = CGRect(x: xPosition, y: 0, width: widthUnit*2, height: cellHeight)
        cell.boothNoLabel.layer.cornerRadius = 20
        cell.boothNoLabel.clipsToBounds = true
        xPosition += widthUnit*2
        cell.messageButton.frame = CGRect(x: xPosition, y: 0, width: widthUnit, height: cellHeight)
        cell.messageButton.layer.cornerRadius = 20
        xPosition += widthUnit
        cell.favoriteButton.frame = CGRect(x: xPosition, y: 0, width: widthUnit, height: cellHeight)
        cell.favoriteButton.layer.cornerRadius = 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeight: CGFloat = favoriteTableView.rectForRow(at: IndexPath(row: 0, section: 0)).height
        var xPosition: CGFloat = 0.0
        let widthUnit = favoriteTableView.frame.width/8
        
        let sectionHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: favoriteTableView.frame.width, height: sectionHeight))
        sectionHeaderView.backgroundColor = .clear
        
        let nameLabel = UILabel(frame: CGRect(x: xPosition, y: 0, width: widthUnit*4, height: sectionHeight))
        nameLabel.text = "Exhibitor Name"
        nameLabel.textAlignment = .center
        nameLabel.layer.cornerRadius = 20
        nameLabel.clipsToBounds = true
        nameLabel.backgroundColor = Constants.headerTitleBackgroundColor
        nameLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .thin)
        nameLabel.textColor = .white
        sectionHeaderView.addSubview(nameLabel)
        
        xPosition += widthUnit*4
        let boothNoLabel = UILabel(frame: CGRect(x: xPosition, y: 0, width: widthUnit*2, height: sectionHeight))
        boothNoLabel.layer.cornerRadius = 20
        boothNoLabel.text = "Booth No"
        boothNoLabel.textAlignment = .center
        boothNoLabel.clipsToBounds = true
        boothNoLabel.backgroundColor = Constants.headerTitleBackgroundColor
        boothNoLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .thin)
        boothNoLabel.textColor = .white
        sectionHeaderView.addSubview(boothNoLabel)
        xPosition += widthUnit*2
        
        
        let messageButton = UIButton(frame: CGRect(x: xPosition, y: 0, width: widthUnit, height: sectionHeight))
        messageButton.layer.cornerRadius = 20
        messageButton.setTitle("M", for: .normal)
        messageButton.backgroundColor = Constants.headerTitleBackgroundColor
        sectionHeaderView.addSubview(messageButton)
        xPosition += widthUnit
        
        let favoriteButton = UIButton(frame: CGRect(x: xPosition, y: 0, width: widthUnit, height: sectionHeight))
        favoriteButton.layer.cornerRadius = 20
        favoriteButton.setTitle("F", for: .normal)
        favoriteButton.backgroundColor = Constants.headerTitleBackgroundColor
        sectionHeaderView.addSubview(favoriteButton)
        
        
        
        return sectionHeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func setupHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: favoriteTableView.frame.width, height: 110))
        headerView.backgroundColor = .clear
        let headerLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 100, y: 10, width: 200, height: 53))
        headerLabel.layer.cornerRadius = 26
        headerLabel.clipsToBounds = true
        headerLabel.text = "Favourite"
        headerLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        headerLabel.textColor = UIColor.darkText
        headerLabel.textAlignment = .center
        headerLabel.backgroundColor = .white
        headerView.addSubview(headerLabel)
        
        let secondHeaderLabel = UILabel(frame: CGRect(x: 30, y: 70, width: 100, height: 30))
        secondHeaderLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        secondHeaderLabel.text = "News List"
        headerView.addSubview(secondHeaderLabel)
        favoriteTableView.tableHeaderView = headerView
    }
    
    func setupFooterView() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: favoriteTableView.frame.width, height: 70))
        footerView.backgroundColor = .clear
        
        let returnButton = UIButton(frame: CGRect(x: view.frame.width/2 - 40, y: 70/2 - 20, width: 80, height: 40))
        returnButton.layer.cornerRadius = 20
        returnButton.setTitle("Return", for: .normal)
        returnButton.backgroundColor = .white
        returnButton.setTitleColor(.darkText, for: .normal)
        returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        //        returnButton.titleLabel?.textColor = .darkText
        
        footerView.addSubview(returnButton)
        
        favoriteTableView.tableFooterView = footerView
    }

}
