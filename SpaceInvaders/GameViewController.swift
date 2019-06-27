//
//  GameViewController.swift
//  SpaceInvaders
//
//  Created by Kenenias Bethuel on 6/26/19.
//  Copyright © 2019 Kene B. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                // gestion de la pausa del video juego
                NotificationCenter.default.addObserver(self,
                                            selector: #selector(self.handleNotificationWillResignActive),
                                            name: UIApplication.willResignActiveNotification,
                                            object: nil)
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.handleNotificationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    @objc func handleNotificationWillResignActive(notification:  NSNotification){
        let view = self.view as! SKView
        view.isPaused = true;
    }
    
    @objc func handleNotificationDidBecomeActive(notification: NSNotification){
        let view = self.view as! SKView
        view.isPaused = false;
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
