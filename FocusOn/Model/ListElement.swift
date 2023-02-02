//
//  ListElement.swift
//  FocusOn
//
//  Created by Eva Madarasz on 01/02/2023.
//

import UIKit


struct ListElement: Equatable {
    
    enum ListEntityType {
        case task
        case goal
        case summary
    }
  
    var type: ListEntityType
    var title: String
    var isCompleted: Bool

}

extension ListElement {
    
    
    
    init(from task : Task) {
        self.type = .task
        self.title = task.title
        self.isCompleted = task.completed
        
    }
    
    init(from goal : Goal) {
        self.type = .goal
        self.title = goal.title
        self.isCompleted = goal.completed
        
    }
   
    init(summary title: String) {
        self.type = .summary
        self.title = title
        self.isCompleted = true
    }
    
}
