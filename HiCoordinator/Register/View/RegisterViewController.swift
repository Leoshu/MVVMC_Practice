//
//  LoginViewController.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var registerVM: RegisterViewModel!
    @IBOutlet weak var lblName: UITextField!
    
    internal static func instantiate(with vm: RegisterViewModel) -> RegisterViewController {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "register") as! RegisterViewController
        vc.registerVM = vm
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressSubmit(_ sender: Any) {
        if let txt = lblName.text, txt.isEmpty == true {
            registerVM.inputUserName = nil
        } else {
            registerVM.inputUserName = lblName.text
        }
        registerVM.dissmiss()
    }
}
