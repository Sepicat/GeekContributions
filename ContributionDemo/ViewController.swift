//
//  ViewController.swift
//  ContributionDemo
//
//  Created by Harry Twan on 2018/9/22.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    private var sceneView: SCNView = SCNView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = SCNView()
        sceneView.backgroundColor = .red
        sceneView.frame = self.view.bounds
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        
        initialViews()
        view.addSubview(sceneView)
    }
    
    func initialViews_1() {
        let scene = SCNScene()
        sceneView.scene = scene
        
        let node = SCNNode()
        node.camera = SCNCamera()
        node.position = SCNVector3Make(0, 5, 10)
        
        scene.rootNode.addChildNode(node)
        
        let boxNode = SCNNode()
        let box = SCNBox.init(width: 1, height: 1, length: 1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.green
        boxNode.geometry = box
        scene.rootNode.addChildNode(boxNode)
    }

    private func initialViews() {
        let scene = SCNScene()
        let light = SCNLight()
        light.type = .directional
        light.color = UIColor.init(white: 1, alpha: 0.2)
        light.shadowColor = UIColor.init(white: 0, alpha: 0.8).cgColor
        
        let lightNode = SCNNode()
        lightNode.eulerAngles = SCNVector3Make(Float(-Double.pi / 3), Float(Double.pi / 4 * 3), 0)
        lightNode.light = light
        scene.rootNode.addChildNode(lightNode)
        
        let cameraNode = SCNNode()
        cameraNode.name = "camreaNode"
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.automaticallyAdjustsZRange = true
        cameraNode.camera?.usesOrthographicProjection = true
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.eulerAngles = SCNVector3Make(Float(-Double.pi / 6), Float(Double.pi / 4), 0)
        
        let barNode = SCNNode()
        barNode.name = "barNode"
        barNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(barNode)
        
        cameraNode.camera?.orthographicScale = 20
        cameraNode.position = SCNVector3Make(22.5, Float(Double.pi / 6.0 * 50 + 2),  Float(Double.pi / 4 * 50));
        
        print(Float(.pi / 4 * 50 - 15 * 1.5), Float(Double.pi / 6.0 * 50 + 2),  Float(Double.pi / 4 * 50))
        
        for weekFromNow in 0 ..< 20 {
            for day in 0 ..< 7 {
                let box = SCNBox.init(width: 1, height: CGFloat(arc4random() % 10 + 1), length: 1, chamferRadius: 0)
                let node = SCNNode.init(geometry: box)
                let mat = SCNMaterial()
                box.materials = [mat]
                mat.diffuse.contents = UIColor.red
                node.position = SCNVector3Make(Float(-weekFromNow) * 1.5, Float(box.height / 2.0), Float(day) * 1.5)
                barNode.addChildNode(node)
            }
        }

        self.sceneView.scene = scene
        
    }

}

