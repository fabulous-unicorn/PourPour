//
//  RunningRecipeState.swift
//  PourPour
//
//  Created by Alesya on 21.10.2021.
//

import Foundation
import SwiftUI

//class RunningRecipeStore: ObservableObject {
//    @Published var currentSecond: Int = 0
//    @Published var lastSecond: Int = 0
//    
//    @Published var isNeedLoad: Bool = false
//}
//
//extension RunningRecipeStore: RunningRecipeDelegate {
//    
//    
//}


//class UserStore: ObservableObject {
//  enum State {
//    case loading
//    case error(message: String)
//    case loaded(users: [UserViewModel])
//  }
//
//  @Published var state: State = .loading
//}
//
//extension UserStore: UserPresenterDelegate {
//  func render(errorMessage: String) {
//    self.state = .error(message: errorMessage)
//  }
//  func render Loading() {
//    self.state = .loading
//  }
//  func render(users: [UserViewModel]) {
//    self.state = .loaded(users: users)
//  }
//}



//struct UsersView: View {
//  var presenter: UserPresenterProtocol
//  @ObservedObject var store: UserStore
//
//  init(store: UserStore, presenter: UserPresenterProtocol) {
//    self.store = store
//    self.presenter = presenter
//  }
