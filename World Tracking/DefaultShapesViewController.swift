//
//  DefaultShapesViewController.swift
//  World Tracking
//
//  Created by admin on 16/10/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import ARKit

class DefaultShapesViewController: UIViewController {

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
        
        //cap radius is how thick the capsule is
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        
        //if topRadius = 0 so the cone will be pointed from top
        //node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.2)
        
        //to make cylinder from cone
//        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.1, height: 0.2)
        
        //for cylinder
//        node.geometry = SCNCylinder(radius: 0.1, height: 0.2)
        
        //for sphere
//        node.geometry = SCNSphere(radius: 0.1)
        
        //for tube
//        node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.2, height: 0.3)
        
        //for torus/ring
        //will use this shape to make basketball hoop/ring
//        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        
        //to make a plane
//        node.geometry = SCNPlane(width: 0.1, height: 0.1)

        //pyramid
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
        //bezier path(custom shapes)
        let path = UIBezierPath()
        //we are drawing a line from (0,0) to (0,0.3)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        //drawing a diagonal line from (0,0.3) to (0.6,0.6)
        //we will draw a house after running this code
        path.addLine(to: CGPoint(x: 0.2, y: 0.4))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0))
        
        //extrusion depth is the thickness of line
        let shape = SCNShape(path: path, extrusionDepth: 0.0002)
        node.geometry = shape
        
        //node has no attributes so we have to give it those attributes
        //first we give it a shape
        //node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        //for rounded edges
        //node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02)
        
        //for making sphere with box
        //node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2)
        
        //giving the geometry a specular light
        //specular is a light that reflected off away the surface
        //node.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        //first material defines the appearance of the surface of our node which is box in ourt matter
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
    
        
        //scnvector3 is a 3 dimensional vector
        //0,0,0 means the box will be at the world origin
        //node.position = SCNVector3(0,0,0)
        //z=-0.3 means 0.3 meters away from z axis
        node.position = SCNVector3(0,0,-0.7)
        
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
    
    //func takes minimum float value and max float value and returns a random number in between them
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }


}
