//
//  LoginFormViewController.swift
//  Project-Weather
//
//  Created by admin on 15.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class LoginFormViewController: UIViewController {
    
    private var firstController = "firstController"
    var animationLoginController : AnimationLoginController?

    @IBOutlet var passswordLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var loginTextFild: UITextField!
    @IBOutlet var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "isLogin") {
            performSegue(withIdentifier: firstController, sender: self)
        }
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self,
                                                         action: #selector(hideKeyboard))
        
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        animationLoginController = AnimationLoginController()
        animationLoginController?.animateAuthButton(button: authButton)
        animationLoginController?.animateFieldsAppearing(loginTextField: loginTextFild, passwordTextField: passwordTextFild)
        animationLoginController?.animationTitleWeather(weatherLabel: weatherLabel, view: self.view)
        animationLoginController?.animationLabel(loginLabel: loginLabel, passwordLabel: passswordLabel, view: self.view)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
              
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }

    @IBAction func loginButton(_ sender: Any) {
        
        let login = loginTextFild.text!
        let password = passwordTextFild.text!
        
        if login == "a" && password == "a" {
            UserDefaults.standard.set(true, forKey: "isLogin")
            performSegue(withIdentifier: firstController, sender: self)
        } else {
            loginError()
        }
    }
    
    func loginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

}
