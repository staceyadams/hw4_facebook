//
//  FeedViewController.swift
//  hw4_facebook
//
//  Created by Stacey Adams on 2/26/15.
//  Copyright (c) 2015 Stacey Adams. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    var selectedImageView: UIImageView!
    var movingImageView: UIImageView!
    var blackView: UIView!
    
    
  //  var interactiveTransition: UIPercentDrivenInteractiveTransition!
    
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
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning!
    {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning!
    {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval
    {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        interactiveTransition = UIPercentDrivenInteractiveTransition()
//        //Setting the completion speed gets rid of a weird bounce effect bug when transitions complete
//        interactiveTransition.completionSpeed = 0.99
//        return interactiveTransition
//    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        // hide original and new copies
//        var feedViewController = fromViewController as FeedViewController
//            feedViewController.selectedImageView.hidden = true
//        var photoViewController = toViewController as PhotoViewController
//            photoViewController.photoDetail.hidden = true
        
        
        // make a copy of the image
        movingImageView = UIImageView(frame: selectedImageView.frame)
        movingImageView.image = selectedImageView.image
        movingImageView.contentMode = selectedImageView.contentMode // fit to scale, etc.
        movingImageView.clipsToBounds = selectedImageView.clipsToBounds // overflow
        
        // retreive the window that is created by iOS and add a view to it
        var window = UIApplication.sharedApplication().keyWindow!;
            window.addSubview(movingImageView)
        var startFrame = window.convertRect(selectedImageView.frame, fromView: scrollView)
        println(startFrame)
        
        if (isPresenting)
        {
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            // setup for black background
            blackView = UIView(frame: fromViewController.view.frame)
            blackView.backgroundColor = UIColor.blackColor()
            blackView.alpha = 0
            containerView.addSubview(blackView)
            containerView.addSubview(toViewController.view)
            
            
            movingImageView.frame = startFrame
            
            
            UIView.animateWithDuration(0.4, animations:
            { () -> Void in
                toViewController.view.alpha = 1
                self.blackView.alpha = 1
            })
            {
                (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    
                    // remove original image from view
                    self.movingImageView.removeFromSuperview()
                
             //   self.movingImageView.frame = photoViewController.photoDetail.frame
            }
        } else
        {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                self.blackView.alpha = 0
                })
                { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    self.movingImageView.removeFromSuperview()
                    self.blackView.removeFromSuperview()
                }
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        var destinationVC = segue.destinationViewController as PhotoViewController
        destinationVC.photoDetailImage = self.selectedImageView.image
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
   
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer)
    {
        var photoDetailImage = sender.view as UIImageView
        selectedImageView = photoDetailImage
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    
    
}
