//
//  UIButtonExt.swift
//  GoalPOST
//
//  Created by alwyn tablatin on 11/05/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit

extension UIButton{
    func Selected(){
        self.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    func Deselect(){
        self.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
}
