//
//  ProfileViewController.swift
//
//  Created by TestProject on 28/07/2017.
//  Copyright © 2017 TestProject. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    var fullName = "";
    @IBOutlet weak var greetings: UILabel!
    
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var validationCountry: UILabel!
    @IBOutlet weak var validationAddress: UILabel!
    @IBOutlet weak var validationEmail: UILabel!
    @IBOutlet weak var validationPhone: UILabel!
    
    @IBOutlet weak var saved: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.country.delegate = self
        self.address.delegate = self
        self.email.delegate = self
        self.phone.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        greetings.text = "Hello " + fullName
        saved.isHidden = true
    }
    
    
    @IBAction func performLogout(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToLogin", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func performSave(_ sender: Any) {
        
        var hasErrors = false;
        
        if (country.text == "") {
            validationCountry.isHidden = false;
            hasErrors = true;
        } else {
            validationCountry.isHidden = true;
        }
        
        if (address.text == "") {
            validationAddress.isHidden = false;
            hasErrors = true;
        } else {
            validationAddress.isHidden = true;
        }
        
        if (email.text == "") {
            validationEmail.isHidden = false;
            hasErrors = true;
        } else {
            validationEmail.isHidden = true;
        }
        
        if (phone.text == "") {
            validationPhone.isHidden = false;
            hasErrors = true;
        } else {
            validationPhone.isHidden = true;
        }
        
        if (!hasErrors) {
            saved.isHidden = false;
        } else {
            saved.isHidden = true;
        }
        
    }
    
}
