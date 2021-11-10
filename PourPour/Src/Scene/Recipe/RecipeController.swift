//
//  RecipeController.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import UIKit

class RecipeController: UITableViewController{
    
    @IBOutlet weak var coffeePropertyView: RecipePropertyView!
    @IBOutlet weak var waterPropertyView: RecipePropertyView!
    @IBOutlet weak var temperaturePropertyView: RecipePropertyView!
    @IBOutlet weak var timePropertyView: RecipePropertyView!
    @IBOutlet weak var descriptionView: UITextView!
    
    var presenter: RecipePresenter!
    
    @IBAction func onEditBarButtonTouched(_ sender: UIBarButtonItem) {
        presenter.editRecipe()
    }
    
    @IBAction func onStartBarButtonTouched(_ sender: UIBarButtonItem) {
        presenter.startRecipe()
    }
    
    @IBAction func onStartButtonTouched(_ sender: PourButton) {
        presenter.startRecipe()
    }
    
    @IBAction func onEditButtonTouched(_ sender: PourButton) {
        presenter.editRecipe()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.nib.recipeStep)
        
        presenter.viewDidLoad()
    }
    
}

extension RecipeController {
    
    
    override func numberOfSections(in: UITableView) -> Int {
        return self.presenter.getNumberSteps() == 0 ? 0 : 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getNumberSteps() + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.stepRecipeCell, for: indexPath)!
        self.presenter.setupRecipeStepCell(cell, indexPath.row)
        return cell
    }
}

extension RecipeController: RecipeView {
    
    func configure(with recipe: RecipeFullEntity) {
        
        self.title = recipe.name
        self.descriptionView.text = recipe.description
        
        self.coffeePropertyView.valueLabel = NSNumber(value: recipe.massCoffee).stringValue
        self.waterPropertyView.valueLabel = "\(recipe.massWater)"
        self.temperaturePropertyView.valueLabel = "\(recipe.temperature)"
        self.timePropertyView.valueLabel = TimeFormater.formMinutesTimerString(from: recipe.duration)
        self.tableView.reloadData()
    }
    
    
}
