//
//  ToDoCell.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 10/06/24.
//

import Foundation
import UIKit


protocol ToDoCellDelegate: AnyObject{
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?
    @IBOutlet var isCompleteButton : UIButton!
    
    @IBOutlet var titleLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
}
