//
//  LoginViewModel.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class RegisterViewModel: NSObject {
    private let interactor: RegisterInteractorProtocol
    private let coordinator: RegisterCoordinatorProtocol
    var inputUserName: String?
    
    init(interactor: RegisterInteractorProtocol, coordinator: RegisterCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func dissmiss() {
        //傳送註冊者名字
        coordinator.completionHandler?(inputUserName)
        coordinator.dismiss()
    }
}
