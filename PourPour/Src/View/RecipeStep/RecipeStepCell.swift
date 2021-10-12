//
//  RecipeStepCell.swift
//  PourPour
//
//  Created by Alesya on 07.10.2021.
//

import Foundation
import UIKit

class RecipeStepCell: UITableViewCell {
    
    @IBOutlet weak var timeLabelContainer: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var massWatterLabel: UILabel!
    @IBOutlet weak var suffixLabel: UILabel!
    
    var entity: RecipeStepEntity!
    
    func setup(_ entity: RecipeStepEntity) {
        
        self.setDesignCell()
        
        self.entity = entity
        self.timeLabel.text = TimeFormaterr.formMinutesTimerString(from: self.entity.time)
        self.massWatterLabel.text = "\(self.entity.massWatter)"
    }
    
    private func setDesignCell() {
        self.timeLabelContainer.layer.cornerRadius = 6
        self.timeLabelContainer.layer.borderWidth = 1.5
        self.timeLabelContainer.layer.borderColor = R.color.controlAccent()?.cgColor
        self.timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: self.timeLabel.font.pointSize, weight: .semibold)
    }
    
    func setupCompletedCell(time: Int) {
    
        self.setDesignCell()
        self.prefixLabel.isHidden = true
        self.suffixLabel.isHidden = true
        
        self.timeLabel.text = TimeFormaterr.formMinutesTimerString(from: time)
        self.massWatterLabel.text = "Завершение"
    }
}
