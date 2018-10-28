//
//  EventOverViewViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 15/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class EventOverViewViewController: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var descriptionLabel: CustomDarkLabel!
    
    var textView: UITextView!
    override func viewDidLoad() {
        self.titleString = "xyz Exhibition"
        super.viewDidLoad()
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                topConstraint.constant = 90
            default:
                print("")
            }
        }
        
        descriptionLabel = CustomDarkLabel()
        descriptionLabel.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        setupScrollView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupScrollView() {
        
        var yPosition: CGFloat = 30.0
        
        let eventTitleLabel = CustomDarkLabel()
        eventTitleLabel.text = "EventTitle"
        eventTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        eventTitleLabel.frame = CGRect(x: 20, y: yPosition, width: 150, height: heightForLabel(text: eventTitleLabel.text!, font: UIFont.systemFont(ofSize: 22, weight: .thin), width: view.frame.width - 40))
        eventTitleLabel.backgroundColor = Constants.labelBackgroundColor
        eventTitleLabel.textColor = .white
        
        
        scrollView.addSubview(eventTitleLabel)
        
        yPosition = yPosition + eventTitleLabel.frame.height
        
        let labelheight = heightForLabel(text: descriptionLabel.text!, font: UIFont.systemFont(ofSize: 22, weight: .thin), width: view.frame.width - 40) + 60
        descriptionLabel.frame = CGRect(x: 20, y: yPosition + 20, width: view.frame.width - 40, height: labelheight)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        descriptionLabel.backgroundColor = Constants.labelBackgroundColor
        descriptionLabel.textColor = .white
        scrollView.addSubview(descriptionLabel)
        
        yPosition = yPosition + 20 + labelheight
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: yPosition + 20, width: view.frame.width - 40, height: 200))
        imageView.image = UIImage(named: "events_medium.jpg")
        imageView.contentMode = .scaleAspectFit
        
        yPosition = yPosition + 220
        
        scrollView.addSubview(imageView)
        
        let returnButton = UIButton(frame: CGRect(x: view.frame.width/2 - 50, y: yPosition + 50, width: 100, height: 40))
        returnButton.backgroundColor = .white
        returnButton.setTitle("Return", for: .normal)
        returnButton.setTitleColor(UIColor.darkGray, for: .normal)
        returnButton.layer.cornerRadius = 20
        returnButton.addTarget(self, action: #selector(returnPressed), for: .touchUpInside)
        
        scrollView.addSubview(returnButton)
        
        yPosition = yPosition + 50 + 40 + 30
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: yPosition)
        
    }
    
    func heightForLabel(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    @objc func returnPressed(){
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
