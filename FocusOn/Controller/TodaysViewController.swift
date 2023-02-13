//
//  ViewController.swift
//  FocusOn
//
//  Created by Eva Madarasz on 26/01/2023.
//

import UIKit
import CoreData



class TodaysViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    

    
    
   
    var todaysGoal: [String] = ["We will rock you","Princes of the Universe","Under pressure"]
    var tasks: [String] = []
 
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Focus On"
        let nib = UINib(nibName: "GoalCell", bundle: nil)
        let taskNib = UINib(nibName: "TaskCell", bundle: nil)
        let summaryNib = UINib(nibName: "SummaryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "GoalCell")
        tableView.register(taskNib, forCellReuseIdentifier: "TaskCell")
        tableView.register(summaryNib, forCellReuseIdentifier: "SummaryCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New task", message: "Add new task", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    
                }
            }
        }))
        
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    
    
    
    //MARK: Table view functions
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
//
//        let cell: GoalCell = (tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as! GoalCell)
//       // cell.configureCheckMarkedCell(item: ListElement(from: Goal))
//        cell.goalText.text = todaysGoal[indexPath.row]
//        cell.title?.text = todaysGoal[indexPath.row]
//
//        cell.textChanged {[weak tableView, weak self] newText in
//            self?.todaysGoal[indexPath.row] = newText
//            cell.title.text = newText
//
//            DispatchQueue.main.async {
//                tableView?.beginUpdates()
//                tableView?.endUpdates()
//            }
//        }

    cell.goalTextLabel?.text = todaysGoal[indexPath.row]
        
    return cell
       
    }
    
    //
    //        var taskCell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell {
    //                cell.configureCheckMarkedCell(item: element)
    //                cell.taskText.text = tasks[indexPath.row]
    //                      cell.title.text = tasks[indexPath.row]
    //
    //                      cell.textChanged {[weak tableView, weak self] newText in
    //                          self?.todaysGoal[indexPath.row] = newText
    //                          cell.title.text = newText
    //
    //                          DispatchQueue.main.async {
    //                              tableView?.beginUpdates()
    //                              tableView?.endUpdates()
    //                          }
    //                      }
    //
    //
    //
    //                return taskCell
    //            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return todaysGoal.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.sectionHeaderTopPadding = 0
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = headerView.frame
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .systemMint
        headerView.addSubview(label)

        return headerView
       
    }
    
}


