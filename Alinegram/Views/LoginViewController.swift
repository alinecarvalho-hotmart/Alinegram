//
//  LoginViewController.swift
//  Alinegram
//
//  Created by Aline Miranda Dutra de Carvalho on 14/07/21.
//

import UIKit
import FirebaseAuth
import FirebaseUI

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
// MARK: - IBActions
  
    @IBAction func loginButtontapped(_ sender: UIButton) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
        else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        
        let providers = [FUIEmailAuth()]
        
        authUI.providers = providers
        present(authViewController, animated: true)
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        print("handle user signup / login")
    }
}
