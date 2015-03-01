//
//  FeedViewController.swift
//  hw4_facebook
//
//  Created by Stacey Adams on 2/26/15.
//  Copyright (c) 2015 Stacey Adams. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var selectedImageView: UIImageView!
    var movingImageView: UIImageView!
    var fadeTransition: FadeTransition!
    var imageTransition: ImageTransition!
    var endFrame: CGRect!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newsFeedImage: UIImageView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = newsFeedImage.frame.size
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer)
    {
        selectedImageView = sender.view as UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        var destinationVC = segue.destinationViewController as PhotoViewController
        destinationVC.photoDetailImage = selectedImageView.image
        
        var height = (selectedImageView.image!.size.height*320)/selectedImageView.image!.size.width
        endFrame = CGRect(x: 0, y: (self.view.frame.size.height - height)/2, width: 320, height: height)
        
        fadeTransition = FadeTransition()
        imageTransition = ImageTransition()
        imageTransition.endFrame = endFrame
        imageTransition.duration = 0.5
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = imageTransition
        destinationVC.endFrame = endFrame
        
        
        
     }
   

    
    
    
}
