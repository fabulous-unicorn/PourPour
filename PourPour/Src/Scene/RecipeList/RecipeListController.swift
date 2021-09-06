//
//  RecipeListController.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import UIKit

class RecipeListController: UITableViewController {

    var presenter: RecipeListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        RecipeListConfiguratorImp().configure(view: self)
    
        presenter.viewDidLoad()
    }
}

extension RecipeListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(presenter.numberOfRowInTable)
        return presenter.numberOfRowInTable
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.recipeCell, for: indexPath)!
        cell.textLabel?.text = presenter.getTitleRecipeCell(indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onRecipeSelected(indexPath.row)
    }
}


extension RecipeListController: RecipeListView {
    
    func reloadTable() {
//        self.reloadTable()
    }

}
