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
    @IBOutlet weak var commonTimeLabel: UILabel!
    @IBOutlet weak var stepTable: UITableView!
    
    var presenter: RunningRecipePresenter!
    var currentActiveStep: Int = 0 {
        didSet {
            self.stepTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stepTable.delegate = self
        self.stepTable.dataSource = self
        self.stepTable.register(R.nib.recipeStep)
        
        presenter.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.presenter.viewDidDisappear()
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
        let inActive = indexPath.row >= self.currentActiveStep
        self.presenter.setupRecipeStepCell(cell, indexPath.row, inActive: inActive)
        return cell
    }
    
}


extension RunningRecipeController: RunningRecipeView {
    
    
    func configure(recipe: RecipeFullEntity) {
        self.navigationItem.title = recipe.name
        self.commonTimeLabel.text = TimeFormaterr.formMinutesTimerString(from: recipe.time)
    }
    
    
    func updateCurrentInstruction(currentSecond: Int, stepForView step: RecipeStepForViewEntity) {
        
        self.instructionLabel.text = "Шаг \(step.numberStep + 1): Влейте \(step.massWatter) гр воды"
        self.timerView.lastSecond = step.lastSecond - step.startSecond
        self.timerView.currentSecond = currentSecond - step.startSecond
        
        if self.currentActiveStep < step.numberStep {
            self.currentActiveStep += 1
            
        }
    }
    
    func setupCompletedStateScene() {
        
        self.currentActiveStep = self.stepTable.numberOfRows(inSection: 0) - 1
        self.instructionLabel.text = "Время насладиться кофе"
        self.timerView.currentSecond = 0
        self.timerView.lastSecond = 0
    }
    
}
