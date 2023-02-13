//
//  GoalCellTableViewCell.swift
//  FocusOn
//
//  Created by Eva Madarasz on 01/02/2023.
//

import UIKit

class GoalCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var goalText: UITextView!
    
    @IBOutlet weak var CheckBoxButton: UIButton!
    
    @IBOutlet weak var title: UILabel!
    
    
    var todaysController = TodaysViewController()
    
    var textChanged: ((String) -> Void)?
      
      override func awakeFromNib() {
          super.awakeFromNib()
          self.goalText.delegate = self
      }
      
      func textChanged(action: @escaping (String) -> Void) {
          self.textChanged = action
      }
      
    @objc func textViewDidChange(_ textView: UITextView) {
          textChanged?(goalText.text)
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
//        goalText.textAlignment = .left
//        goalText.text = item.title
//        if item.isCompleted {
//            checkMark.image =  UIImage(systemName: "checkmark.rectangle.fill")!.withTintColor(.systemMint, renderingMode: .alwaysOriginal)
//        } else {
//            checkMark.image = UIImage(systemName: "checkmark.rectangle")!.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
//        }
//    }
//

}
