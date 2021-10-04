//
//  RecipeController.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import UIKit

class RecipeController: UIViewController{
    
    var presenter: RecipePresenter!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RecipeController: RecipeView {
    
}
