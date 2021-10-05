//
//  RecipeController.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import UIKit

class RecipeController: UIViewController{
    
    @IBOutlet weak var descriptionView: UITextView!
    
    @IBAction func onEditButtonTouched(_ sender: Any) {
    }
    
    @IBAction func onStartButtonTouched(_ sender: Any) {
    }
    
    var presenter: RecipePresenter!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RecipeController: RecipeView {
    
}
