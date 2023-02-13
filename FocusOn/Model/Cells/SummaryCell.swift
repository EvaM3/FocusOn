//
//  SummaryCell.swift
//  FocusOn
//
//  Created by Eva Madarasz on 02/02/2023.
//

import UIKit

class SummaryCell: UITableViewCell {

  
    @IBOutlet weak var title: UILabel!
    
    

    
    func configureCell(item: ListElement) {
        title.textAlignment = .center
        title.text = item.title
    }
    
}
