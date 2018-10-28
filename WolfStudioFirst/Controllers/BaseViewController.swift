//
//  BaseViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 15/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var topGradientView: UIView!
    var titleLabel: UILabel!
    var titleString: String!
    var backButton: UIButton!
    var menuButton: UIButton!
    
    var menuBackgroundView: UIView!
    var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopBar()
        setupMenu()
        Utilities.addGradientToView(theView: view)
    }
    @objc func backButtonPressed(){
        _ = navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setupTopBar() {
        topGradientView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 120))
        Utilities.addGradientToTopBar(theView: topGradientView)
        
        titleLabel = UILabel(frame: CGRect(x: (view.frame.width - 250)/2, y: 35, width: 250, height: 70))
        titleLabel.text = titleString
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 35.0, weight: .thin)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = Constants.headerTitleBackgroundColor
        topGradientView.addSubview(titleLabel)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
        backButton.backgroundColor = .clear
        backButton.setTitle("<--", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        topGradientView.addSubview(backButton)
        
        menuButton = UIButton(frame: CGRect(x: view.frame.width - 50, y: 20, width: 50, height: 50))
        menuButton.backgroundColor = .clear
        menuButton.setTitle("menu", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        
        topGradientView.addSubview(menuButton)
        
        
        
        view.addSubview(topGradientView)
    }
    func setupMenu() {
        menuBackgroundView = UIView(frame: view.frame)
        menuBackgroundView.backgroundColor = .black
        menuBackgroundView.alpha = 0.5
        menuBackgroundView.isUserInteractionEnabled = true
        menuBackgroundView.isHidden = true
        
        let menuViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideMenuBackgroundView))
        menuBackgroundView.addGestureRecognizer(menuViewTapGestureRecognizer)
        view.addSubview(menuBackgroundView)
        
        menuView = UIView(frame: view.frame)
        menuView.frame.size.width /= 2
        menuView.frame.origin.x = view.frame.width
        Utilities.addGradientToView(theView: menuView)
        view.addSubview(menuView)
    }
    @objc func hideMenuBackgroundView(){
        menuBackgroundView.isHidden = true
        UIView.animate(withDuration: 0.2) {
            self.menuView.frame.origin.x = self.view.frame.width
        }
    }
    @objc func menuButtonPressed(){
        menuBackgroundView.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.menuView.frame.origin.x = self.view.frame.width/2
        }
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
