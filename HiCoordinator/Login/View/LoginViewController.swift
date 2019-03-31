//
//  LoginViewController.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginVM: LoginViewModel!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    
    internal static func instantiate(with vm: LoginViewModel) -> LoginViewController {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "login") as! LoginViewController
        vc.loginVM = vm
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = loginVM.userName {
            lblName.text = "Hi \(name)"
            lblMsg.text = ""
        } else {
            lblName.text = "Hi User!"
            lblMsg.text = "Please register first"
        }
    }

    @IBAction func pressLoginBtn(_ sender: Any) {
        if let _ = loginVM.userName {
            loginVM.presentMain()
        } else {
            let alert = showAlert(title: "Note", message: "Please register", ActionBtns: nil)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func pressRegisterBtn(_ sender: Any) {
        loginVM.presentRegister()
    }
    
    func showAlert(title: String!, message msg: String!, ActionBtns btns:[UIAlertAction]?) -> UIAlertController{
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        if let _btns = btns {
            for _btn in _btns {
                alert.addAction(_btn)
            }
        } else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
        }
        
        let attributedString = NSAttributedString(string: msg, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        alert.setValue(attributedString, forKey: "attributedMessage")
        return alert
    }
}
