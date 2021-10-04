//
//  RecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation

protocol RecipePresenter {

}


protocol RecipeView: class {
    
}


class RecipePresenterImp: RecipePresenter {

    private weak var view: RecipeView!
    private let router: RecipeRouter

    init(_ view: RecipeView, _ router: RecipeRouter) {
        self.view = view
        self.router = router
    }

}
