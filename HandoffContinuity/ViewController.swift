//
//  ViewController.swift
//  HandoffContinuity
//
//  Created by Henrique Valcanaia on 2/27/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserActivity()
    }
    
    private func createUserActivity(){
        let activity = NSUserActivity(activityType: "xyz.henriquevalcanaia.HandoffContinuity.notes.edit")
        activity.title = "Editing"
        activity.userInfo = ["title": titleTextField.text!, "content": contentTextField.text]
        self.userActivity = activity;
        self.userActivity?.becomeCurrent()
    }
    
    override func updateUserActivityState(activity: NSUserActivity) {
        activity.addUserInfoEntriesFromDictionary(["title": titleTextField.text!, "content": contentTextField.text])
        super.updateUserActivityState(activity)
    }
    
    deinit {
        userActivity?.invalidate()
    }
    
    override func restoreUserActivityState(activity: NSUserActivity) {
        if let userInfo:[NSObject:AnyObject] = activity.userInfo{
            titleTextField.text = userInfo["title"] as? String
            contentTextField.text = userInfo["content"] as? String
        }
    }
    
}

