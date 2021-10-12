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
    func touchInfo()
}


protocol RecipeListView: class {
    
    func reloadTable()
}


class RecipeListPresenterImp: RecipeListPresenter {

    private weak var view: RecipeListView!
    private let router: RecipeListRouter
    private let gateway: RecipeGateway
    
    private var recipeList: [RecipeEntity] = []
    var numberOfRowInTable: Int { return recipeList.count }

    init(_ view: RecipeListView, _ router: RecipeListRouter, _ gateway: RecipeGateway) {
        self.view = view
        self.router = router
        self.gateway = gateway
    }

    func viewDidLoad() {
        loadTableData()
        view.reloadTable()
    }

    func loadTableData() {
        self.recipeList = self.gateway.getRecipeList()
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

    func touchInfo() {
        self.router.openInfoSceen()
    }
}
