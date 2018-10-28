//
//  QuestionireViewController.swift
//  WolfStudioFirst
//
//  Created by Ashik on 15/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class QuestionireViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var qOneLabel: UILabel!
    @IBOutlet weak var aOneButton: CustomButton!
    @IBOutlet weak var qTwoLabel: UILabel!
    @IBOutlet weak var aTwoTextView: CustomTextView!
    @IBOutlet weak var sendAnswerButton: CustomButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var thankyouLabel: UILabel!
    @IBOutlet weak var returnButton: CustomButton!
    
    var answerPickerView: UIPickerView!
    let pickerViewData = ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5", "Answer 6", "Answer 7", "Answer 8"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerPickerView = UIPickerView(frame: aOneButton.frame)
        answerPickerView.frame.origin.y += aOneButton.frame.size.height + 5
        answerPickerView.frame.size.height = 200
        answerPickerView.layer.cornerRadius = 10
        answerPickerView.isHidden = true
        answerPickerView.backgroundColor = UIColor.black
        answerPickerView.alpha = 0.8
        answerPickerView.setValue(UIColor.white, forKeyPath: "textColor")
        
        answerPickerView.delegate = self
        view.addSubview(answerPickerView)
        
        
        
        
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                topConstraint.constant = 90
            default:
                print("")
            }
        }

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        aOneButton.setTitle(pickerViewData[row], for: .normal)
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }

    @IBAction func sendAnswerPressed(_ sender: Any) {
        UIView.transition(with: qOneLabel, duration: 0.2, options: .curveEaseOut, animations: {
            self.qOneLabel.alpha = 0.0
            self.aOneButton.alpha = 0.0
            self.qTwoLabel.alpha = 0.0
            self.aTwoTextView.alpha = 0.0
            self.sendAnswerButton.alpha = 0.0
        }) { (target) in
            self.qOneLabel.isHidden = true
            self.aOneButton.isHidden = true
            self.qTwoLabel.isHidden = true
            self.aTwoTextView.isHidden = true
            self.sendAnswerButton.isHidden = true
            
            UIView.transition(with: self.thankyouLabel, duration: 0.5, options: .curveEaseIn, animations: {
                
                self.thankyouLabel.alpha = 1.0
                self.returnButton.alpha = 1.0
                
            }, completion: { (target) in
                
                self.thankyouLabel.isHidden = false
                self.returnButton.isHidden = false
                
            })
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func openDropDown(_ sender: Any) {
        if(answerPickerView.isHidden){
            answerPickerView.selectRow(pickerViewData.count - 1, inComponent: 0, animated: true)
            answerPickerView.isHidden = false
        }
        else{
            answerPickerView.isHidden = true
        }
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
