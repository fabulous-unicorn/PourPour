//
//  RunningRecipeRouter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import UIKit

protocol RunningRecipeRouter {
    
}

class RunningRecipeRouterImp: RunningRecipeRouter {
    
    let view: RunningRecipeController
    
    
    init(_ view: RunningRecipeController) {
        self.view = view
    }
}

