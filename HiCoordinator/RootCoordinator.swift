//
//  RootCoordinator.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

final class RootCoordinator {
    
    static func present() -> UIViewController {
        if let _ = loadUserName() {
            return presentMain()
        } else {
            return presentLogin()
        }
    }
    
    static private func presentLogin() -> UINavigationController {
        let loginCoordinator = LoginCoordinator()
        let loginInteractor = LoginInteractor()
        let loginViewModel = LoginViewModel(interactor: loginInteractor, coordinator: loginCoordinator)
        let loginViewController = LoginViewController.instantiate(with: loginViewModel)
        
        let navigationController = UINavigationController(rootViewController: loginViewController)
        loginCoordinator.navi = navigationController
        
        return navigationController
    }
    
    static private func presentMain() ->UIViewController {
        let interactore = MainInteractor()
        let coordinator = MainCoordinator()
        let mainVM = MainViewModel(interactor: interactore, coordinator: coordinator)
        let mainVC = MainViewController.instantiate(with: mainVM)
        coordinator.backFromMain = { () in
            swapRootViewController(newController: presentLogin())
        }
        return mainVC
    }
    
    static private func swapRootViewController(newController: UIViewController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let window = appDelegate.window {
            window.rootViewController?.dismiss(animated: false, completion: nil)
            
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = newController
            }, completion: nil)
        }
    }
    
    static private func loadUserName() -> String? {
        return CacheManager.loadString(key: KEY_USER_NAME)
    }
}

