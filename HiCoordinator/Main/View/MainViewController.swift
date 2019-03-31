//
//  LoginViewController.swift
//  HiCoordinator
//
//  Created by Leo_hsu on 2019/3/31.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainVM: MainViewModel!
    @IBOutlet weak var lblName: UILabel!
    
    internal static func instantiate(with vm: MainViewModel) -> MainViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as! MainViewController
        vc.mainVM = vm
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = mainVM.getUserName()
    }

    @IBAction func pressLogout(_ sender: Any) {
        mainVM.logout()
    }
}
