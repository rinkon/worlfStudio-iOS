//
//  ShoplistViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 16/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class ShoplistViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
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
        shopTableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 4
        default:
            return 5
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoplistReuseid") as! ShoplistTableViewCell
        cell.exhibitorNameLabel.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: shopTableView.bounds.width, height: 44))
        headerView.backgroundColor = .clear
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 2, width: shopTableView.bounds.width, height: 38))
        headerLabel.clipsToBounds = true
        headerLabel.layer.cornerRadius = 8
        headerLabel.backgroundColor = Constants.labelBackgroundColor
        
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        headerLabel.text = "   line \(section + 1)"
        headerView.addSubview(headerLabel)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func returnPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
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
