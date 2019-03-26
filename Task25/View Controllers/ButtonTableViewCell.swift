//
//  ButtonTableViewCell.swift
//  Task25
//
//  Created by Hannah Hoff on 3/13/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    var delegate: ButtonTableViewCellDeletgate?
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!

    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }


    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
}

protocol ButtonTableViewCellDeletgate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
        
    }
}
