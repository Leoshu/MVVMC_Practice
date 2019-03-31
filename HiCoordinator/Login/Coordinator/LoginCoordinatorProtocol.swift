//
//  LoginCoordinatorProtocol.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

typealias Callback = (String?)->Void
typealias Voidback = () -> Void

protocol LoginCoordinatorProtocol: class {
    var navi: UINavigationController? {get set}
    func presentToMain()
    var backFromMain: Voidback? {get set}
    
    func presentToRegister()
    var completionHandler: Callback? {get set}
}
