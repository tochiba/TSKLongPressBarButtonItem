//
//  ViewController.swift
//  ToolBar
//
//  Created by 千葉 俊輝 on 2015/11/14.
//  Copyright © 2015年 Toshiki Chiba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TSKLongPressBarButtonDelegate {

    @IBOutlet weak var barButtonItem: TSKLongPressBarButtonItem!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // setup
        self.barButtonItem.setLongTapGesture(5.0, minimumPressDuration: 2.0, numberOfTapsRequired: 0, numberOfTouchesRequired: 1, state: .Ended, buttonDelegate: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapBarButton(sender: AnyObject) {
        //self.barButtonItem.removeLongGesture()
    }
    
    func handleLongPressGesture(sender: AnyObject) {
        // code
        self.label.text = "Long press success!"
    }
}

