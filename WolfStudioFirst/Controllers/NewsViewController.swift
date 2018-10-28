//
//  NewsViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 16/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var newsTableView: UITableView!
    
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
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsReuseId") as! NewsTableViewCell
        return cell
    }
    
    func setupHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: newsTableView.frame.width, height: 110))
        headerView.backgroundColor = .clear
        let headerLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 100, y: 10, width: 200, height: 53))
        headerLabel.layer.cornerRadius = 26
        headerLabel.clipsToBounds = true
        headerLabel.text = "News"
        headerLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        headerLabel.textColor = UIColor.darkText
        headerLabel.textAlignment = .center
        headerLabel.backgroundColor = .white
        headerView.addSubview(headerLabel)
        
        let secondHeaderLabel = UILabel(frame: CGRect(x: 30, y: 70, width: 100, height: 30))
        secondHeaderLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        secondHeaderLabel.text = "News List"
        headerView.addSubview(secondHeaderLabel)
        newsTableView.tableHeaderView = headerView
    }
    
    func setupFooterView() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: newsTableView.frame.width, height: 70))
        footerView.backgroundColor = .clear
        
        let returnButton = UIButton(frame: CGRect(x: view.frame.width/2 - 40, y: 70/2 - 20, width: 80, height: 40))
        returnButton.layer.cornerRadius = 20
        returnButton.setTitle("Return", for: .normal)
        returnButton.backgroundColor = .white
        returnButton.setTitleColor(.darkText, for: .normal)
        returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .thin)
//        returnButton.titleLabel?.textColor = .darkText
        
        footerView.addSubview(returnButton)
        
        newsTableView.tableFooterView = footerView
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
