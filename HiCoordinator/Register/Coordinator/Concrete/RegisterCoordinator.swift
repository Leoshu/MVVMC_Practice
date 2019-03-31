//
//  LoginCoordinator.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class RegisterCoordinator: RegisterCoordinatorProtocol {
    weak var navi: UINavigationController?
    var completionHandler: Callback?
    
    func dismiss() {
        assert(navi != nil, "should set NavigationController")
        navi?.popViewController(animated: true)
    }
}
