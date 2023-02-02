//
//  ViewController.swift
//  FocusOn
//
//  Created by Eva Madarasz on 26/01/2023.
//

import UIKit
import CoreData

class TodaysViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  
    var todaysGoal = [Goal]()
    var tasks = [Task]()
    var listModel: HistoryListModelProtocol = HistoryListModel(dataManager: CoreDataManager())
    
    
    @IBOutlet weak var tableView: UITableView!
  
    @IBAction func addButtonPressed(_ sender: UIButton) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Goal", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
           
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new goal"
        }
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "GoalCell", bundle: nil), forCellReuseIdentifier: "goalCell")
        tableView.register(UINib(nibName: "TaskCell",bundle: nil), forCellReuseIdentifier: "taskCell")
        tableView.register(UINib(nibName: "MonthlySummaryCell",bundle: nil), forCellReuseIdentifier: "summaryCell")
        super.viewDidLoad()
 
     
    }

    
//MARK: Table view functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let element = listModel.sectionRows[indexPath.section][indexPath.row]
        switch element.type {
        case .goal:
            return 60
            
        case .task:
            return 40
          
        case .summary:
            return 30
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listModel.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let element = listModel.sectionRows[indexPath.section][indexPath.row]
        
        switch element.type {
        
        case .goal:
            if let cell: GoalCell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell {
                cell.configureCheckMarkedCell(item: element)
                return cell
            }
            
        case .task:
            if let cell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskCell {
                cell.configureCheckMarkedCell(item: element)
                return cell
            }
        
        case .summary:
            if let cell: SummaryCell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? SummaryCell {
                cell.configureCell(item: element)
                return cell
            }
            
            
        }
        
        return UITableViewCell()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listModel.sectionRows[section].count
    }
    


}

