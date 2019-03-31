//
//  LoginCoordinatorProtocol.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

protocol RegisterCoordinatorProtocol: class {
    var navi: UINavigationController? {get set}
    func dismiss()
    var completionHandler: Callback? {get set}
}
