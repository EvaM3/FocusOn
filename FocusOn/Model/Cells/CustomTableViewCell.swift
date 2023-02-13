//
//  CustomTableViewCell.swift
//  FocusOn
//
//  Created by Eva Madarasz on 09/02/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var goalTextLabel: UILabel!
    
    @IBOutlet weak var CheckBoxButton: UIButton!
    


    class CheckBoxButton: UIButton {
        
        override func awakeFromNib() {
            self.setImage(UIImage(named:"checkmark.circle.fill")!.withTintColor(.systemMint, renderingMode: .alwaysOriginal), for: .selected)
            self.setImage(UIImage(named:"checkmark.circle")!.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
            self.addTarget(self, action: #selector(CheckBoxButton.buttonClicked(_:)), for: .touchUpInside)
        }
        
        @objc func buttonClicked(_ sender: UIButton) {
           // self.isSelected = !self.isSelected
            if (sender.isSelected == true)
               {
                sender.setBackgroundImage(UIImage(named:"checkmark.circle.fill")!.withTintColor(.systemMint, renderingMode: .alwaysOriginal), for: .selected)
                sender.isSelected = false;
               }
               else
               {
                   sender.setBackgroundImage(UIImage(named:"checkmark.circle")!.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
                   sender.isSelected = true;
               }
           }
        }
        
    }

