//
//  ParticleScene.swift
//  WeatherApp
//
//  Created by Leonna Myers on 14/5/2024.
//

import Foundation
import SpriteKit

class ParticleScene: SKScene {
    var fileName: String
    
    init(fileName: String, size: CGSize) {
        self.fileName = fileName
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("coder is not r")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        setupParticleEmitter()
    }
    
    private func setupParticleEmitter() {
        if let particleEmitter = SKEmitterNode(fileNamed: fileName) {
            particleEmitter.position = CGPoint(x: size.width / 2, y: size.height)
            addChild(particleEmitter)
        } else {
            print("setup particle emitter gone to shit")
        }
    }

}
