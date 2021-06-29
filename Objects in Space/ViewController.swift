//
//  ViewController.swift
//  Objects in Space
//
//  Created by C. Jordan Ball III on 6/25/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01);
        let ball = SCNSphere(radius: 0.1);
        let pyramid = SCNPyramid(width: 0.3, height: 0.5, length: 0.3);
        
        let cubeMaterial = SCNMaterial();
        cubeMaterial.diffuse.contents = UIColor.red;
        cube.materials = [cubeMaterial]

        let ballMaterial = SCNMaterial();
        ballMaterial.diffuse.contents = UIColor.blue;
        ball.materials = [ballMaterial];
        
        let pyramidMaterial = SCNMaterial();
        pyramidMaterial.diffuse.contents = UIColor.yellow;
        pyramid.materials = [pyramidMaterial];
        
        let cubeNode = SCNNode();
        let ballNode = SCNNode();
        let pyramidNode = SCNNode();
        
        cubeNode.position = SCNVector3(x: 0, y: 0.1, z: -0.5);
        ballNode.position = SCNVector3(x: 0.3, y: -0.1, z: -0.25);
        pyramidNode.position = SCNVector3(x: -0.5, y: 0.0, z: -1.0);

        cubeNode.geometry = cube;
        ballNode.geometry = ball;
        pyramidNode.geometry = pyramid;
        
        sceneView.scene.rootNode.addChildNode(cubeNode);
        sceneView.scene.rootNode.addChildNode(ballNode);
        sceneView.scene.rootNode.addChildNode(pyramidNode);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
}
