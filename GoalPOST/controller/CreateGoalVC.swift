//
//  CreateGoalVC.swift
//  GoalPOST
//
//  Created by alwyn tablatin on 10/05/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate{

    @IBOutlet weak var textviewGoal: UITextView!
    @IBOutlet weak var shortTermbtn: UIButton!
    @IBOutlet weak var longTermGoal: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermbtn.Selected()
        longTermGoal.Deselect()
        textviewGoal.delegate = self
    }
    @IBAction func backBtntTapped(_ sender: Any) {
        dismissVC()
    }
    @IBAction func shortTermBtnTapped(_ sender: Any) {
        goalType = .shortTerm
        shortTermbtn.Selected()
        longTermGoal.Deselect()
    }
    @IBAction func longTermBtnTapped(_ sender: Any) {
        goalType = .longTerm
        shortTermbtn.Deselect()
        longTermGoal.Selected()
    }
    @IBAction func nextBtnTapped(_ sender: Any) {
        if textviewGoal.text != "" && textviewGoal.text != "What is your goal?"{
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "finishedGoal") as? FinishedGoal else {return}
            
            vc.transferData(description: textviewGoal.text, type: goalType)
            
            presentingViewController?.secondaryPresent(vc)
       }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textviewGoal.text = ""
        textviewGoal.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    

}
