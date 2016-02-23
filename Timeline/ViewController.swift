//
//  ViewController.swift
//  Timeline
//
//  Created by Mohammed Elsammak on 2/23/16.
//  Copyright © 2016 Elsammak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(animated: Bool) {
        let vc = TimelineViewController()
        self.presentViewController(vc, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

