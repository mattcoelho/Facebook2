//
//  SignInViewController.swift
//  Facebook
//
//  Created by Teus on 10/15/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginView: UIView!
    
    @IBAction func onTap(sender: AnyObject) {loginView.endEditing(true)
        

    }
    
    @IBOutlet weak var button: UIButton!
    @IBAction func logInButton(sender: UIButton) {
    }

    @IBAction func editingChanged(sender: AnyObject) {
        
        if usernameText.text!.isEmpty || passwordText.text!.isEmpty {
        // set the button state to disabled
            button.enabled = false
        // otherwise
    } else {
        // set the button state to enabled
        button.enabled = true
        }
    }
    
    
    var initialY: CGFloat!
    let offset: CGFloat = -50
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
        }

    

// Delay for 2 seconds, then run the code between the braces.
delay(2) {
    self.checkPassword()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialY = loginView.frame.origin.y

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {

        self.loginView.frame.origin = CGPoint(x: self.loginView.frame.origin.x, y: self.initialY + self.offset)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        self.loginView.frame.origin = CGPoint(x: self.loginView.frame.origin.x, y: self.initialY)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
