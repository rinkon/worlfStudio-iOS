//
//  PreRegistrationViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 25/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class PreRegistrationViewController: BaseViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var registrationView: UIView!
    var contentHeight: CGFloat!
    var contentWidth: CGFloat!
    
    var registrationTableView: UITableView!
    var secondRegistrationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                topConstraint.constant = 90
            default:
                print("")
            }
        }
        contentHeight = view.frame.height - topConstraint.constant
        contentWidth = view.frame.width
        setupFirstView()
    }
    
    func setupFirstView() {
        registrationTableView = UITableView(frame: CGRect(x: 0, y: 120, width: contentWidth, height: contentHeight))
        registrationTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseId")
        registrationTableView.backgroundColor = .clear
        registrationTableView.rowHeight = 83
        registrationTableView.dataSource = self
        registrationTableView.delegate = self
        registrationTableView.separatorStyle = .none
        registrationTableView.allowsSelection = false
        registrationTableView.tableHeaderView = setUpHeaderFor(index: 0)
        registrationTableView.tableFooterView = setupFooterView(index: 0)
        view.addSubview(registrationTableView)
    }
    func setupSecondView() {
        var yPosition: CGFloat = 120
        let headerLabel = setUpHeaderFor(index: 0)
        headerLabel.frame.origin.y = yPosition
        yPosition += headerLabel.frame.height
        view.addSubview(headerLabel)
        
        secondRegistrationTableView = UITableView(frame: CGRect(x: 30, y: yPosition, width: view.frame.width - 60, height: view.frame.height - yPosition - 70))
        view.addSubview(secondRegistrationTableView)
        
        let footerView = setupFooterView(index: 0)
        footerView.frame.origin.y = secondRegistrationTableView.frame.origin.y + secondRegistrationTableView.frame.height
        view.addSubview(footerView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setUpHeaderFor(index: Int) -> UIView {
        if(index == 0){
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: registrationTableView.frame.width, height: 130))
            headerView.backgroundColor = .clear
            let headerLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 150, y: 10, width: 300, height: 53))
            headerLabel.numberOfLines = 0
            headerLabel.layer.cornerRadius = 26
            headerLabel.clipsToBounds = true
            headerLabel.text = "Pre-Registration Ticket"
            headerLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
            headerLabel.textColor = UIColor.darkText
            headerLabel.textAlignment = .center
            headerLabel.backgroundColor = .white
            headerView.addSubview(headerLabel)
            
            let secondHeaderLabel = UILabel(frame: CGRect(x: 0, y: 70, width: view.frame.width, height: 50))
            secondHeaderLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
            secondHeaderLabel.text = "Pre-registration input form"
            secondHeaderLabel.textAlignment = .center
            headerView.addSubview(secondHeaderLabel)
            return headerView
        }
        return UIView()
    }
    func setupFooterView(index: Int) -> UIView {
        if (index == 0){
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: registrationTableView.frame.width, height: 70))
            footerView.backgroundColor = .clear
            
            let returnButton = UIButton(frame: CGRect(x: view.frame.width/2 - 40, y: 70/2 - 20, width: 80, height: 40))
            returnButton.layer.cornerRadius = 20
            returnButton.setTitle("Return", for: .normal)
            returnButton.backgroundColor = .white
            returnButton.setTitleColor(.darkText, for: .normal)
            returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .thin)
            returnButton.addTarget(self, action: #selector(dismissFirstSection), for: .touchUpInside)
            //        returnButton.titleLabel?.textColor = .darkText
            
            footerView.addSubview(returnButton)
            
            return footerView
        }
        return UIView()
    }
    @objc func dismissFirstSection() {
        self.registrationTableView.isHidden = true
//        UIView.transition(with: registrationTableView, duration: 0.5, options: .curveEaseOut, animations: {
//            self.registrationTableView.isHidden = true
//        }, completion: nil)
        setupSecondView()
    }
    
}

extension PreRegistrationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseId") as! TableViewCell
//        cell.textLabel!.text = "\(indexPath.row)"
//        cell.backgroundColor = .clear
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
