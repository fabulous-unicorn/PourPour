//
//  RecipeController.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import UIKit

class RecipeController: UIViewController{
    
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
    }
}
