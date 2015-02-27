//
//  PhotoViewController.swift
//  hw4_facebook
//
//  Created by Stacey Adams on 2/26/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoDetail: UIImageView!
    var photoDetailImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoDetail.image = photoDetailImage
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


    @IBAction func didPressDone(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
