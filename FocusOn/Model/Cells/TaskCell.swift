//
//  TaskCell.swift
//  FocusOn
//
//  Created by Eva Madarasz on 01/02/2023.
//

import UIKit

class TaskCell: UITableViewCell, UITextViewDelegate {
    
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var taskText: UITextView!
    
    @IBOutlet weak var CheckBoxButton: UIButton!
    
    
    
    var listElement = ListElement.self
    
    var textChanged: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.taskText.delegate = self
    }
    
    func textChanged(action: @escaping (String) -> Void) {
        self.textChanged = action
    }
    
    @objc func textViewDidChange(_ textView: UITextView) {
        textChanged?(taskText.text)
    }
    
    
    class CheckBoxButton: UIButton {
        
        override func awakeFromNib() {
            self.setImage(UIImage(named:"selected"), for: .selected)
            self.setImage(UIImage(named:"rectangle"), for: .normal)
            self.addTarget(self, action: #selector(CheckBoxButton.buttonClicked(_:)), for: .touchUpInside)
        }
        
        @objc func buttonClicked(_ sender: UIButton) {
            self.isSelected = !self.isSelected
        }
        
    }
    
    //
    //    func configureCheckMarkedCell(item: ListElement) {
    //        title.textAlignment = .left
    //        title.text = item.title
    //
    //        if item.isCompleted {
    //            checkMark.image =  UIImage(systemName: "checkmark.rectangle.fill")!.withTintColor(.systemMint, renderingMode: .alwaysOriginal)
    //        } else {
    //            checkMark.image = UIImage(systemName: "checkmark.rectangle")!.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
    //        }
    //    }
    //
    //
    
}
