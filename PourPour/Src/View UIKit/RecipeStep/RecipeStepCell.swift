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
    
    func setup(_ entity: RecipeStepEntity, inActive: Bool = true) {
        
        self.setDesignCell(inActive: inActive)
        
        self.entity = entity
        self.timeLabel.text = TimeFormater.formMinutesTimerString(from: self.entity.startTime)
        self.massWatterLabel.text = "\(self.entity.massWatter)"
    }
    
    private func setDesignCell(inActive: Bool) {
        self.timeLabelContainer.layer.cornerRadius = 6
        self.timeLabelContainer.layer.borderWidth = 1.5
        self.timeLabelContainer.layer.borderColor = R.color.controlAccent()?.cgColor
        self.timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: self.timeLabel.font.pointSize, weight: .semibold)
        self.contentView.alpha = inActive ? 1 : 0.4
    }
    
    func setupCompletedCell(time: Int) {
    
        self.setDesignCell(inActive: true)
        self.prefixLabel.isHidden = true
        self.suffixLabel.isHidden = true
        
        self.timeLabel.text = TimeFormater.formMinutesTimerString(from: time)
        self.massWatterLabel.text = "Завершение"
    }
}
