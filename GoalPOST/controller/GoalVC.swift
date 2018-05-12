//
//  ViewController.swift
//  GoalPOST
//
//  Created by alwyn tablatin on 09/05/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {
    
    var goalList = [Goal]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchObject()
        tableView.reloadData()
        print("\(goalList.count)")
    }
    func fetchObject(){
        self.fetch { (complete) in
            if complete {
                if goalList.count > 0 {
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
    }
    @IBAction func createGoalTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "createGoal") else {return}
        
        presentNextView(vc)
    }
    
}
extension GoalVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell()}
        
        let goals = goalList[indexPath.row]
        
        cell.config(goal: goals)
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchObject()
        }

        deleteAction.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)

        return [deleteAction]
    }
}
extension GoalVC {
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContext.delete(goalList[indexPath.row])
        
        do{
            try managedContext.save()
            print("success deleting data")
        } catch {
            debugPrint("error removing data \(error.localizedDescription)")
        }
    }
    func fetch(complation: (_ complete: Bool) -> ()){
         guard let managedContext = appDelegate?.persistentContainer.viewContext else{ return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goalList = try managedContext.fetch(fetchRequest)
            complation(true)
        } catch {
            print("error fetching data in coredata")
            complation(false)
        }
        
        tableView.reloadData()
    }
}


















