//
//  RotationsViewController.swift
//  World Tracking
//
//  Created by admin on 17/10/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import ARKit

class RotationsViewController: UIViewController {

    /*
     three types of rotations(x,y,z)
     x axis(row rotation) = along the x axis or horizontal axis
     y axis(pitch) = along y axis or vertical axis
     z axis(yaw) = clockwise rotation
     */
    
    
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
        /* ************** x rotation *************** */
//        let node = SCNNode()
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0,0,-0.2)
//        //main property thats involved in rotation is euler angles
//        //euler angles control a nodes orientation
//        node.eulerAngles = SCNVector3(Float(180.degreesToRadians),0,0)
//        self.sceneView.scene.rootNode.addChildNode(node)
        
        /* ************** y rotation *************** */
//        let node = SCNNode()
//        node.geometry = SCNPlane(width: 0.1, height: 0.1)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0,0,-0.2)
//        //main property thats involved in rotation is euler angles
//        //euler angles control a nodes orientation
//        node.eulerAngles = SCNVector3(0,Float(90.degreesToRadians),0)
//        self.sceneView.scene.rootNode.addChildNode(node)

        /* ************** z rotation *************** */
//        let node = SCNNode()
//        node.geometry = SCNCylinder(radius: 0.05, height: 0.1)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0,0,-0.2)
//        //main property thats involved in rotation is euler angles
//        //euler angles control a nodes orientation
//        node.eulerAngles = SCNVector3(0,0,Float(90.degreesToRadians))
//        self.sceneView.scene.rootNode.addChildNode(node)
        
        /* ************** relative rotation on x axis *************** */
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.05, height: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(0,0,-0.2)
//        main property thats involved in rotation is euler angles
//        euler angles control a nodes orientation
        node.eulerAngles = SCNVector3(Float(90.degreesToRadians),0,0)
        self.sceneView.scene.rootNode.addChildNode(node)
        
//        the pyramid is placed at the back of the cylinder but in relative rotation, to preserve its orientation to the cylinder the pyramid had to rotate 90 degrees around the cylinder
//        rule = if you horizontally rotate the parent node around itself, the child node is going to vertically rotate around the parent node to preserve its relative orientation to its parent
        
        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        pyramid.position = SCNVector3(0,0,-0.2)
        node.addChildNode(pyramid)
        
        /* ************** relative rotation on y axis *************** */
//        let node = SCNNode()
//        node.geometry = SCNPlane(width: 0.1, height: 0.1)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0,0,-0.2)
        //main property thats involved in rotation is euler angles
        //euler angles control a nodes orientation
//        node.eulerAngles = SCNVector3(0,Float(90.degreesToRadians),0)
//        self.sceneView.scene.rootNode.addChildNode(node)
        
        //the pyramid is placed at the back of the cylinder but in relative rotation, to preserve its orientation to the cylinder the pyramid had to rotate 90 degrees around the cylinder
        //rule = if you vertically rotate the parent node around itself, the child node is going to vertically rotate around the parent node to preserve its relative orientation to its parent
        
//        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        pyramid.position = SCNVector3(0,0,-0.2)
//        node.addChildNode(pyramid)

        /* ************** relative rotation on z axis *************** */
//        let node = SCNNode()
//        node.geometry = SCNCylinder(radius: 0.05, height: 0.2)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0,0,-0.2)
//        node.eulerAngles = SCNVector3(0,0,Float(90.degreesToRadians))
//        self.sceneView.scene.rootNode.addChildNode(node)

        //rule = if you rotate parent node on z axis so the child node will not rotate around parent node but around itself
//        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        pyramid.position = SCNVector3(0,0,-0.2)
//        node.addChildNode(pyramid)

        
        /* ************** rotating the house *************** */

        
//        let node = SCNNode()
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
//        node.position = SCNVector3(0.2,0.3,-0.2)
//        //when we are rotating the pyramid the box will also rotate around the pyramid to preserve its orientation
//        node.eulerAngles = SCNVector3(Float(180.degreesToRadians),0,0)
//
//        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
//        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//
//        boxNode.position = SCNVector3(0,-0.05,0)
//
//        let doorNode = SCNNode(geometry: SCNPlane(width: 0.05, height: 0.07))
//        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        doorNode.position = SCNVector3(0,-0.015,0.051)

//        node.addChildNode(boxNode)
//        boxNode.addChildNode(doorNode)


        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    //button for resetting world tracking configuration
    @IBAction func resetTapped(_ sender: Any) {
        //first we have to pause the session
        self.restartSession()
    }
    
    func restartSession() {

        self.sceneView.session.pause()

        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            //for removing node from root/parent node
            node.removeFromParentNode()
        }
        

        self.sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }
    

    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }

}

//converting degrees to radians
extension Int {
    var degreesToRadians: Double {
        return Double(self) * .pi/180
    }
}
