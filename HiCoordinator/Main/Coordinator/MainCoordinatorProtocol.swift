//
//  LoginCoordinatorProtocol.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

protocol MainCoordinatorProtocol: class {
    var navi: UINavigationController? {get set}
    func userLogout()
    var backFromMain: (() -> ())? {get set}
}
