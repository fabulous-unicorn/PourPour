//
//  RecipeListController.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import UIKit

class RecipeListController: UITableViewController {

    var presenter: RecipeListPresenter!
    
    @IBAction func touchInfo(_ sender: UIBarButtonItem) {
        self.presenter.touchInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        RecipeListConfiguratorImp().configure(view: self)
    
        self.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshControl?.beginRefreshing()
        presenter.viewDidLoad()
    }
    
    @objc func refreshData() {
        presenter.refreshItems()
    }
}

extension RecipeListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    //design cell
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = R.color.highlightCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = nil
        }
    }
}


extension RecipeListController: RecipeListView {
    
    func reloadTable() {
        self.endRefreshing()
        self.tableView.reloadData()
    }

    func endRefreshing() {
        self.refreshControl?.endRefreshing()
    }
}
