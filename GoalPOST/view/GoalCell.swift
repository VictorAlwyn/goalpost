//
//  GoalCell.swift
//  GoalPOST
//
//  Created by alwyn tablatin on 09/05/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalCompletionValue: UILabel!
    @IBOutlet weak var completeView: UIView!
    
    func config(goal: Goal){
        self.goalDescription.text = goal.goalDescription
        self.goalType.text = goal.goalType
        self.goalCompletionValue.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            completeView.isHidden = false
        }else{
            completeView.isHidden = true
        }
    }
    
}
