//
//  RegisterViewController.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/8/21.
//

import UIKit
import Firebase
import FirebaseAuth



class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message.
    
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String? {
        // Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        // Check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters and contains a special character and a number."
        }
        
        return nil
    }
    
    


    @IBAction func registerButtonTapped(_ sender: Any) {
    
     //Validate the fields
        let error = validateFields()
        
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
        } else {
            
            // Create cleaned version of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //Check for errors
                if err != nil {
                    //There was an error creating the user
                    self.showError("Error creating user")
                } else {
                    
                    // User was created successfully, now store the email and password
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["email":email, "password":password, "uid":result!.user.uid]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    //Transition to the home screen
                    self.transitionToHome()
                }
            }
            
            
        }

        
    }
    
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let categoryNVC = self.storyboard?.instantiateViewController(identifier: "CategoryNVC") as? CategoryNavigationViewController
        
        view.window?.rootViewController = categoryNVC
        
        view.window?.makeKeyAndVisible()
    }
}
    
    

