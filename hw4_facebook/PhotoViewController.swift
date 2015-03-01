//
//  PhotoViewController.swift
//  hw4_facebook
//
//  Created by Stacey Adams on 2/26/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
  
    var endFrame:CGRect!

    @IBOutlet weak var photoDetail: UIImageView!
    var photoDetailImage: UIImage!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoDetail.image = photoDetailImage
        photoDetail.frame = endFrame
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
    
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view)
        var location = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        
        
        if (sender.state == UIGestureRecognizerState.Began)
        {
            
        } else if (sender.state == UIGestureRecognizerState.Changed)
        {
            if velocity.y > 30
            {
                dismissViewControllerAnimated(true, completion: nil)
            }
                
            else
            {
                dismissViewControllerAnimated(false, completion: nil)
            }
            
        } else if (sender.state == UIGestureRecognizerState.Ended)
        {
            
        }
    }
    
    
    
}
