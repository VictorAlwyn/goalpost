//
//  FinishedGoal.swift
//  GoalPOST
//
//  Created by alwyn tablatin on 11/05/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit
import CoreData

class FinishedGoal: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var pointGoal: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func transferData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pointGoal.delegate = self
        
        let createGoal = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        
        createGoal.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        createGoal.setTitle("Create Goal", for: .normal)
        createGoal.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        createGoal.addTarget(self, action: #selector(self.CreateGoalFunc), for: .touchUpInside)
        
        pointGoal.inputAccessoryView = createGoal
    }
    @objc func CreateGoalFunc(){
        if pointGoal.text != ""{
            self.save(Completion: { (complete) in
                if complete{
                    dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    func save( Completion: (_ finish: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointGoal.text!)!
        goal.goalProgress = Int32(0)
        
        do{
           try managedContext.save()
            print("success")
            Completion(true)
        }catch{
            debugPrint("could not save")
            Completion(false)
        }
        
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissVC()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pointGoal.text = ""
    }
    
}
