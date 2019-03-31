//
//  LoginCoordinator.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class LoginCoordinator: LoginCoordinatorProtocol {
    //這屬性一定要weak避免循環引用
    weak var navi: UINavigationController?
    var completionHandler: Callback?
    var completion: Voidback?
    
    func presentToMain() {
        let interactore = MainInteractor()
        let coordinator = MainCoordinator()
        let mainVM = MainViewModel(interactor: interactore, coordinator: coordinator)
        let mainVC = MainViewController.instantiate(with: mainVM)
        coordinator.navi = navi
        coordinator.backFromMain = completion
        //使用present另開一個新流程
        navi?.present(mainVC, animated: true, completion: nil)
    }
    
    func presentToRegister() {
        let interactore = RegisterInteractor()
        let coordinator = RegisterCoordinator()
        let registerVM = RegisterViewModel(interactor: interactore, coordinator: coordinator)
        let registerVC = RegisterViewController.instantiate(with: registerVM)
        coordinator.navi = navi
        coordinator.completionHandler = completionHandler

        //使用相同NavigationController push
        navi?.pushViewController(registerVC, animated: true)
    }
}
