//
//  LoginViewModel.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class MainViewModel: NSObject {
    private let interactor: MainInteractorProtocol
    private let coordinator: MainCoordinatorProtocol
    
    init(interactor: MainInteractorProtocol, coordinator: MainCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func logout() {
        CacheManager.remove(key: KEY_USER_NAME)
        coordinator.userLogout()
    }
    
    func getUserName() -> String {
        guard let name = CacheManager.loadString(key: KEY_USER_NAME) else {
            return "no user name!"
        }
        return name
    }
    
}
