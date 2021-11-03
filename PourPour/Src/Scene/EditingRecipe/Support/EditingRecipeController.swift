//
//  EditingRecipeController.swift
//  PourPour
//
//  Created by Alesya on 03.11.2021.
//

import UIKit
import SwiftUI

class EditingRecipeController: UIViewController {
    //TODO: Подумать над общим hostview для swiftui
    var contentView: UIHostingController<EditingRecipeScene>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(self.contentView)
        self.view.addSubview(contentView.view)
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.contentView.view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.contentView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.contentView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.contentView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setTitle(_ title: String) {
        self.navigationItem.title = title
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
