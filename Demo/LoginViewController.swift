//
//  LoginViewController.swift
//
//  Created by TestProject on 28/07/2017.
//  Copyright © 2017 TestProject. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let VALID_PASSWORD = "12345";
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var validationFullName: UILabel!
    @IBOutlet weak var validationPassword: UILabel!
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fullName.text = nil;
        password.text = nil;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toProfile") {
            let vc = segue.destination as! ProfileViewController
            vc.fullName = fullName.text!
        }
    }
    
    @IBAction func performLogin(_ sender: Any) {
        
        var hasErrors = false;
        
        if (fullName.text == "") {
            validationFullName.isHidden = false;
            hasErrors = true;
        } else {
            validationFullName.isHidden = true;
        }
        
        if (password.text != VALID_PASSWORD) {
            validationPassword.isHidden = false;
            hasErrors = true;
        } else {
            validationPassword.isHidden = true;
        }
        
        if (!hasErrors) {
            performSegue(withIdentifier: "toProfile", sender: self);
        }
    }
    
}

