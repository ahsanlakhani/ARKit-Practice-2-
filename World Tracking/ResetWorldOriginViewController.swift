//
//  ResetWorldOriginViewController.swift
//  World Tracking
//
//  Created by admin on 14/10/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import ARKit

class ResetWorldOriginViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    //world tracking is used to track the orientation of your device realtive to the real world
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //world origin is your starting position
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        //we have to run the configuration when view loads
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addBoxTapped(_ sender: Any) {
        //a node is simply a position in space/sceneView it has no shape no size no color
        let node = SCNNode()
        
        //node has no attributes so we have to give it those attributes
        //first we give it a shape
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)

        //first material defines the appearance of the surface of our node which is box in ourt matter
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        //scnvector3 is a 3 dimensional vector
        //0,0,0 means the box will be at the world origin
        //node.position = SCNVector3(0,0,0)
        
        //z=-0.3 means 0.3 meters away from z axis
        node.position = SCNVector3(0,0,-0.3)
        
        //add the node to the scene view
        //the scene is what's displaying the camera view of the real world
        //the scene has the root node which has no shape no size no color and its positioned exactly where the world tracking is
        //when we give the rootNode a child node named node then the node will be positioned relatively to the rootNode
        self.sceneView.scene.rootNode.addChildNode(node)
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
    

}
