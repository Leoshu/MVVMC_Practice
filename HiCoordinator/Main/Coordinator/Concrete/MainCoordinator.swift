//
//  LoginCoordinator.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class MainCoordinator: MainCoordinatorProtocol {
    weak var navi: UINavigationController?
    var backFromMain: (() -> ())?
    
    func userLogout() {
        navi?.dismiss(animated: true, completion: nil)
        self.backFromMain?()
    }
}
