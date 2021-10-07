//
//  RecipeController.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import UIKit

class RecipeController: UIViewController{
    
    @IBOutlet weak var coffeePropertyView: RecipePropertyView!
    @IBOutlet weak var watterPropertyView: RecipePropertyView!
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
        presenter.viewDidLoad()
    }
    
}

extension RecipeController: RecipeView {
    
    func configure(with recipe: RecipeFullEntity) {
        
        self.title = recipe.name
        self.descriptionView.text = recipe.description
        
        self.coffeePropertyView.valueLabel = NSNumber(value: recipe.massCoffee).stringValue
        self.watterPropertyView.valueLabel = "\(recipe.massWatter)"
        self.temperaturePropertyView.valueLabel = "\(recipe.temperature)"
        self.timePropertyView.valueLabel = formMinutesTimerString(from: recipe.time)
    }
    
    func formMinutesTimerString(from seconds: Int) -> String {
        let minutesTimer = seconds / 60
        let secondsTimer = seconds - minutesTimer * 60
        
        if minutesTimer<10 {
            return "0\(minutesTimer):\(secondsTimer)"
        } else {
            return "\(minutesTimer):\(secondsTimer)"
        }
    }
}
