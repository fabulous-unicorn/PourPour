//
//  RunningRecipeController.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import UIKit

class RunningRecipeController: UIViewController {
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var timerView: TimerView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var commonTimeLabel: UILabel!
    @IBOutlet weak var stepTable: UITableView!
    
    var presenter: RunningRecipePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stepTable.delegate = self
        self.stepTable.dataSource = self
        self.stepTable.register(R.nib.recipeStep)
        self.title = self.presenter.getNameScreen()
        
        presenter.viewDidLoad()
    }
}


extension RunningRecipeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in: UITableView) -> Int {
        return self.presenter.getNumberSteps() == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getNumberSteps() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.stepRecipeCell, for: indexPath)!
        self.presenter.setupRecipeStepCell(cell, indexPath.row)
        return cell
    }
    
}


extension RunningRecipeController: RunningRecipeView {
    
    func updateCurrentStep(numberStep: Int, step: RecipeStepEntity?) {
        
        if numberStep == self.stepTable.numberOfRows(inSection: 0) {
            self.instructionLabel.text = "Время насладиться кофе"
            self.timerLabel.isHidden = true
            self.timerView.percents = 100
        } else {
            
            guard let step = step else {
                fatalError("Отсутствует сущность шага")
            }
            
            self.instructionLabel.text = "Шаг \(numberStep): Влейте \(step.massWatter) гр воды"
            self.timerLabel.text = "00:02"
        }
    }
}
