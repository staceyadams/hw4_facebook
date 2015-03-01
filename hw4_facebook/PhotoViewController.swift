//
//  PhotoViewController.swift
//  hw4_facebook
//
//  Created by Stacey Adams on 2/26/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
  
    
    @IBOutlet weak var photoViewBG: UIView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet weak var photoDetail: UIImageView!
    var photoDetailImage: UIImage!
    var photoDetailImageStart: CGPoint!
    var endFrame:CGRect!
    var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoDetail.image = photoDetailImage
        photoDetail.frame = endFrame
        photoViewBG = blackView
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
        if (sender.state == UIGestureRecognizerState.Began)
        {
            photoDetailImageStart = photoDetail.center
        } else if (sender.state == UIGestureRecognizerState.Changed)
        {
            photoDetail.center = CGPoint(x: photoDetailImageStart.x, y: photoDetailImageStart.y + translation.y)
           // println(photoDetail.center)
            
            UIView.animateWithDuration(0.2, animations:
            { () -> Void in
                self.doneButton.alpha = 0
                self.photoActions.alpha = 0
//                self.photoViewBG.alpha = 0
                self.blackView.alpha = 0
            })
 
        } else if (sender.state == UIGestureRecognizerState.Ended)
        {
            if photoDetail.center.y > 300
            {
                dismissViewControllerAnimated(true, completion: nil)
            }
                
            else
            {
                photoDetail.center = photoDetailImageStart
                UIView.animateWithDuration(0.2, animations:
                    { () -> Void in
                        self.doneButton.alpha = 1
                        self.photoActions.alpha = 1
//                        self.photoViewBG.alpha = 0
                })
            }
        }
    }
    
    
    
}
