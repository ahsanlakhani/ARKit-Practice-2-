//
//  RelativePositioningViewController.swift
//  World Tracking
//
//  Created by admin on 17/10/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import ARKit

class RelativePositioningViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    //world tracking is used to track the orientation of your device realtive to the real world
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //world origin is your starting position
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        //we have to run the configuration when view loads
        self.sceneView.session.run(configuration)
        
        //giving scene view a source of light for the node to be able to reflect it
        //it is an omni directional light source for the scene view
        self.sceneView.autoenablesDefaultLighting = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addBoxTapped(_ sender: Any) {
        //a node is simply a position in space/sceneView it has no shape no size no color
        let node = SCNNode()
        //pyramid
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        node.position = SCNVector3(0.2,0.3,-0.2)
        
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        //this is relative to the root node
//        node1.position = SCNVector3(-0.1,0.5,-0.5)
        
        //if we want to make node1 relative to the node so
        //if we put y=0 so it will position node1 on the mid/center of the node
        boxNode.position = SCNVector3(0,-0.05,0)
        
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.05, height: 0.07))
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        doorNode.position = SCNVector3(0,-0.015,0.051)
        
        //and then we will make node1 a child of node
        node.addChildNode(boxNode)
        boxNode.addChildNode(doorNode)
        
        //we made a house with pyramid and box
        
        self.sceneView.scene.rootNode.addChildNode(node)
//        self.sceneView.scene.rootNode.addChildNode(node1)
    }
    
    //button for resetting world tracking configuration
    @IBAction func resetTapped(_ sender: Any) {
        //first we have to pause the session
        self.restartSession()
    }
    
    func restartSession() {
        //first we have to pause the session
        //when we pause the session it stops keeping track of your position or orientation
        self.sceneView.session.pause()
        
        //now remove the box node from the scene view
        //we are enumerating through every single child nodes of root node and box node is one of them
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            //for removing node from root/parent node
            node.removeFromParentNode()
        }
        
        //now we will re run the session such that it has the same config and will restart the tracking
        //anchor is basically the information of the position and orientation of an object
        self.sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }
    
    //func takes minimum float value and max float value and returns a random number in between them
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }

}
