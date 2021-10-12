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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stepTable: UITableView!
    
    var presenter: RunningRecipePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.stepTable.delegate = self
        self.stepTable.dataSource = self
        self.stepTable.register(R.nib.recipeStep)
        self.title = self.presenter.getNameScreen()
    }
}


extension RunningRecipeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getNumberSteps()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.stepRecipeCell, for: indexPath)!
        self.presenter.setupRecipeStepCell(cell, indexPath.row)
        return cell
    }
    
}


extension RunningRecipeController: RunningRecipeView {
    
    func updateCurrentStep(with step: RecipeStepEntity) {
        
        self.instructionLabel.text = "Влейте \(step.massWatter) гр воды"
        self.timerLabel.text = "00:02"
    }
}
