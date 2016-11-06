//
//  ViewController.swift
//  FirebaseDenemesi
//
//  Created by Arda SENTURK on 05/11/2016.
//  Copyright © 2016 Arda SENTURK. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Anonyous LogIn Button Function
    @IBAction func createAccountAction(_ sender: Any) {
        
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            
            if error != nil {
                
                print(error)
                return
                
            }
            
            print("User Logged in anonymously with uid: " + (user?.uid)!)
            
            self.alert(message: "Your user ID is: " + (user?.uid)!, title: "Firebase Sign In Success")
            
        })
        
    }
    
    //SignOut Button Function
    @IBAction func signOutAction(_ sender: Any) {
        
        print("User Logged Out!")
        try! FIRAuth.auth()?.signOut()
        
        alert(message: "", title: "Firebase Log Out Success")
        
    }
    
    func alert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

