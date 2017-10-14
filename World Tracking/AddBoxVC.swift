//
//  ViewController.swift
//  World Tracking
//
//  Created by admin on 12/10/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import ARKit

class AddBoxVC: UIViewController {
    
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
    


}

