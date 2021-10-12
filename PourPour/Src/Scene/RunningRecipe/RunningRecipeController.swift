//
//  RunningRecipeController.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import UIKit

class RunningRecipeController: UIViewController {
    
    var presenter: RunningRecipePresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


extension RunningRecipeController: RunningRecipeView {
    
}
