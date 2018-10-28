//
//  SeminarScheduleViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 23/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class SeminarScheduleViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var seminarScheduleTableView: UITableView!
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seminarReuseId") as! SeminarScheduleTableViewCell
        cell.containerView.layer.cornerRadius = 10
        if indexPath.row == 1 {
            cell.seminarDescriptionLabel.text = "This is some random description just to see if the cell height of the table view increase dynamically and to see if the code is correctomando"
        }
        return cell
        
    }

    func setupHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: seminarScheduleTableView.frame.width, height: 60))
        headerView.backgroundColor = .clear
        let headerLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 100, y: 10, width: 200, height: 53))
        headerLabel.layer.cornerRadius = 26
        headerLabel.clipsToBounds = true
        headerLabel.text = "Seminar Schedule"
        headerLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        headerLabel.textColor = UIColor.darkText
        headerLabel.textAlignment = .center
        headerLabel.backgroundColor = .white
        headerView.addSubview(headerLabel)
        
        seminarScheduleTableView.tableHeaderView = headerView
    }
    
    func setupFooterView() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: seminarScheduleTableView.frame.width, height: 70))
        footerView.backgroundColor = .clear
        
        let returnButton = UIButton(frame: CGRect(x: view.frame.width/2 - 40, y: 70/2 - 20, width: 80, height: 40))
        returnButton.layer.cornerRadius = 20
        returnButton.setTitle("Return", for: .normal)
        returnButton.backgroundColor = .white
        returnButton.setTitleColor(.darkText, for: .normal)
        returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        //        returnButton.titleLabel?.textColor = .darkText
        
        footerView.addSubview(returnButton)
        
        seminarScheduleTableView.tableFooterView = footerView
    }

}
