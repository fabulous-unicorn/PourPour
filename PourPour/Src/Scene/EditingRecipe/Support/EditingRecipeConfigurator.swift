//
//  EditingRecipeConfigurator.swift
//  PourPour
//
//  Created by Alesya on 03.11.2021.
//

import UIKit
import SwiftUI
class EditingRecipeConfigurator {

    func configure(view: EditingRecipeController, recipe: RecipeFullEntity) {

        let swifyUIview = UIHostingController(rootView: EditingRecipeScene(recipe: recipe))
        view.contentView = swifyUIview
        view.setTitle(recipe.name)
    }

    static func open(navigationController: UINavigationController, recipe: RecipeFullEntity) {

        let view = R.storyboard.editingRecipe.editingRecipeVC()!
        EditingRecipeConfigurator().configure(view: view, recipe: recipe)
        navigationController.pushViewController(view, animated: true)
    }
}
