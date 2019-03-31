//
//  LoginViewModel.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    private let interactor: LoginInteractorProtocol
    private let coordinator: LoginCoordinatorProtocol
    var userName: String?
    
    init(interactor: LoginInteractorProtocol, coordinator: LoginCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func presentRegister() {
        //用來接收註冊的回傳值
        coordinator.completionHandler =  { [unowned self] (name: String?) in
            self.userName = name
        }
        coordinator.presentToRegister()
    }
    
    func presentMain() {
        CacheManager.save(value: userName, key: KEY_USER_NAME)
        //用來取得Main page logout的事件
        coordinator.completion = { [unowned self]  () in
            self.userName = nil
        }
        coordinator.presentToMain()
    }
}
