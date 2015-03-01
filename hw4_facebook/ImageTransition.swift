//
//  ImageTransition.swift
//  hw4_facebook
//
//  Created by Stacey Adams on 2/28/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    var blackView: UIView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController)
    {
        
        // hide source and destination images
        var tabViewController = fromViewController as UITabBarController
        var feedNavViewController = tabViewController.viewControllers![0] as UINavigationController
        var feedViewController = feedNavViewController.topViewController as FeedViewController
            feedViewController.selectedImageView.hidden = true
        var photoViewController = toViewController as PhotoViewController
            photoViewController.photoDetail.hidden = true
        
        
        // make a copy of the image
        var movingImageView = UIImageView(image: feedViewController.selectedImageView.image) // the image jpg
//        movingImageView.frame = feedViewController.selectedImageView.frame
//        movingImageView.contentMode = feedViewController.selectedImageView.contentMode // fit to scale, etc.
//        movingImageView.contentMode = .ScaleAspectFit
        movingImageView.contentMode = feedViewController.selectedImageView.contentMode
       
        movingImageView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds // overflow
        containerView.addSubview(movingImageView) // create the copy as a subview

        // set a new frame so we can start the image from the same point
        var frame = containerView.convertRect(feedViewController.selectedImageView.frame, fromView: feedViewController.scrollView)
        movingImageView.frame = frame
        
        // create black background
        blackView = UIView(frame: fromViewController.view.frame)
        blackView.backgroundColor = UIColor.blackColor()
        blackView.alpha = 0
        containerView.addSubview(blackView)
        containerView.addSubview(toViewController.view)
  
        toViewController.view.alpha = 0

        UIView.animateWithDuration(duration, animations: {
        
            
         self.blackView.alpha = 1
         movingImageView.frame = self.endFrame
            
            }) { (finished: Bool) -> Void in
                self.finish()
                
              toViewController.view.alpha = 1
              photoViewController.photoDetail.hidden = false //unhide the real image
              movingImageView.removeFromSuperview() // make the copy go away
        }
    }
    
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var tabViewController = toViewController as UITabBarController
        var feedNavViewController = tabViewController.viewControllers![0] as UINavigationController
        var feedViewController = feedNavViewController.topViewController as FeedViewController
        var photoViewController = fromViewController as PhotoViewController
        photoViewController.photoDetail.hidden = false
        feedViewController.selectedImageView.hidden = false
        
       //  make a copy of the image
        var movingImageView = UIImageView(image: photoViewController.photoDetail.image) // the image jpg
        movingImageView.contentMode = feedViewController.selectedImageView.contentMode
        movingImageView.clipsToBounds = photoViewController.photoDetail.clipsToBounds // overflow
        containerView.addSubview(movingImageView) // create the copy as a subview
        
        var frame = containerView.convertRect(feedViewController.selectedImageView.frame, fromView: feedViewController.scrollView)

        fromViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            self.blackView.alpha = 0
            movingImageView.frame = frame
            }) { (finished: Bool) -> Void in
                self.finish()
                movingImageView.removeFromSuperview() // make the copy go away
        }
    }
}