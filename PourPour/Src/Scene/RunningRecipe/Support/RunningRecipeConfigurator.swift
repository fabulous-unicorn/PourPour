//
//  RunningRecipeConfigurator.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import UIKit
import SwiftUI

class RunningRecipeConfigurator {

    func configure(view: RunningRecipeController, recipe: RecipeFullEntity) {

        let swifyUIview = UIHostingController(rootView: RunningRecipeScene(recipe: recipe))
        view.contentView = swifyUIview
    }

    static func open(navigationController: UINavigationController, recipe: RecipeFullEntity) {

        let view = R.storyboard.runningRecipe.runningRecipeSceen()!
        RunningRecipeConfigurator().configure(view: view, recipe: recipe)
        navigationController.pushViewController(view, animated: true)
    }
}
