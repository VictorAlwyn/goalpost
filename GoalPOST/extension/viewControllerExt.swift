//
//  viewControllerExt.swift
//  GoalPOST
//
//  Created by alwyn tablatin on 10/05/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit

extension UIViewController{
    func presentNextView(_ viewController: UIViewController){
        let trasition = CATransition()
        trasition.duration = 0.3
        trasition.type = kCATransitionPush
        trasition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(trasition, forKey: kCATransition)
        
        present(viewController, animated: false, completion: nil)
    }
    func secondaryPresent(_ viewController: UIViewController){
        let trasition = CATransition()
        trasition.duration = 0.3
        trasition.type = kCATransitionPush
        trasition.subtype = kCATransitionFromRight
        
        guard let presentcontroller = presentedViewController else { return }
        
        presentcontroller.dismiss(animated: false) {
            self.view.window?.layer.add(trasition, forKey: kCATransition)
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    func dismissVC(){
        let trasition = CATransition()
        trasition.duration = 0.3
        trasition.type = kCATransitionPush
        trasition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(trasition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
