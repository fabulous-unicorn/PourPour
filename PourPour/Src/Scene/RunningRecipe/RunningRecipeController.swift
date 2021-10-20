//
//  RunningRecipeSceneController.swift
//  PourPour
//
//  Created by Alesya on 20.10.2021.
//

import UIKit
import SwiftUI

class RunningRecipeController: UIViewController {
    
    let contentView = UIHostingController(rootView: RunningRecipeScene())
    
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
}
