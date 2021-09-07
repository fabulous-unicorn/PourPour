//
//  RecipeListPresenter.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import Foundation

protocol RecipeListPresenter {

    var numberOfRowInTable: Int { get }
    func viewDidLoad()
    func loadTableData()
    func refreshItems()
    func getTitleRecipeCell(_ index: Int) -> String
    func onRecipeSelected(_ index: Int)
}


protocol RecipeListView: class {
    
    func reloadTable()
}


class RecipeListPresenterImp: RecipeListPresenter {

    private weak var view: RecipeListView!
    private let router: RecipeListRouter
    private var recipeList: [RecipeEntity]
    var numberOfRowInTable: Int { return recipeList.count }

    init(_ view: RecipeListView, _ router: RecipeListRouter) {
        self.view = view
        self.router = router
        self.recipeList = []
    }

    func viewDidLoad() {
        loadTableData()
        view.reloadTable()
    }

    func loadTableData() {
        self.recipeList = [
            RecipeEntity(id: 0, name: "Колумбия \(Int.random(in: 0..<10))"),
            RecipeEntity(id: 1, name: "Коста-Рика \(Int.random(in: 0..<10))"),
            RecipeEntity(id: 2, name: "Бразилия \(Int.random(in: 0..<10))"),
            RecipeEntity(id: 3, name: "Кения \(Int.random(in: 0..<10))"),
            RecipeEntity(id: 4, name: "Эфиопия \(Int.random(in: 0..<10))")]
    }

    func refreshItems() {
        self.loadTableData()
        view.reloadTable()
    }

    func getTitleRecipeCell(_ index: Int) -> String {
        return self.recipeList[index].name
    }
    
    func onRecipeSelected(_ index: Int) {
        self.router.openRecipe(index)
    }

}
