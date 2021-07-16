//
//  CreateUsernameViewController.swift
//  Alinegram
//
//  Created by Aline Miranda Dutra de Carvalho on 16/07/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    // MARK: - Subviews
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 1
        guard let firUser = Auth.auth().currentUser,
              let username = usernameTextField.text,
              !username.isEmpty else { return }
        
        let userAttrs = ["username": username]
        
        ref = Database.database().reference()
        self.ref.child("users").child(firUser.uid).setValue(userAttrs) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
        }
            ref.child("users").child(firUser.uid).observeSingleEvent(of: .value, with: { snapshot in
                let user = User(snapshot: snapshot)
                print(user as Any)

            }) { error in
              print(error.localizedDescription)
            }
        }
    }
    
    
   

