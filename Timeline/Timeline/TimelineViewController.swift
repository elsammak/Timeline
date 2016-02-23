//
//  TimelineViewController.swift
//  Workflow
//
//  Created by Mohammed Elsammak on 2/23/16.
//  Copyright © 2016 Civilsoft. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    //size of timeline node
    var nodeHeight:Float = 200.0;
    var differenceBetweenNodes:Float = 0.0;
    var middleLineWidth:Float = 5;
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        nodeHeight = nodeHeight * getHightRatio()
        differenceBetweenNodes = differenceBetweenNodes * getHightRatio()
        
        let count = 4
        let scrollContentHeight = (Float(count) * nodeHeight) + differenceBetweenNodes * Float((count - 1))
        //Set Scrollview content size
        scrollView.contentSize = CGSizeMake(scrollView.bounds.width, CGFloat(scrollContentHeight))
        
        for index in 0...count-1{
            if(index % 2 == 0){ //Add right node
                let rightNode = TimelineRightNodeView();
                addNodeToScrollView(rightNode.view, index: index)
                scrollView.addSubview(rightNode.view);
            }
            else{ //Add left node
                let leftNode = TimelineLeftNodeView();
                addNodeToScrollView(leftNode.view, index: index)
                scrollView.addSubview(leftNode.view)
            }
        }
    }

    private func addNodeToScrollView(node: UIView, index: Int){

        let y = Float(index) * nodeHeight + (Float(index) * differenceBetweenNodes)
        
        var frame = node.frame
        if(index % 2 == 0){ //Add to right
            frame.origin.x = UIScreen.mainScreen().bounds.size.width/2.0 - CGFloat(middleLineWidth/2.0)
        }
        else{ //Add to left
            frame.origin.x = CGFloat(middleLineWidth/2.0)
        }
        frame.origin.y = CGFloat(y)
        frame.size.height = CGFloat(nodeHeight)
        frame.size.width = UIScreen.mainScreen().bounds.size.width/2.0;
        node.frame = frame
    }

    /**
     This method is used to get the ratio between current device height and height used when designing the mockups.
     Use this method to modify your constraints to fit in all screen sizes
     
     - returns: Ratio of height as a float value.
     */
    func getHightRatio() -> Float{
        return Float(UIScreen.mainScreen().bounds.size.height)/480.0;
    }
    
    /**
     This method is used to get the ratio between current device width and width used when designing the mockups.
     Use this method to modify your constraints to fit in all screen sizes
     
     - returns: Ratio of width as a float value.
     */
    func getWidthRatio() -> Float{
        return Float(UIScreen.mainScreen().bounds.size.width)/320.0;
    }
}
