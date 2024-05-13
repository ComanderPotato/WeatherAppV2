//
//  SnowSpriteKitView.swift
//  WeatherApp
//
//  Created by Leonna Myers on 14/5/2024.
//

import Foundation
import SwiftUI
import SpriteKit

struct SpriteKitView: UIViewRepresentable {
    var fileName: String
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let particleScene = ParticleScene(fileName: fileName, size: CGSize(width: 300, height: 300))
        particleScene.scaleMode = .aspectFill
        skView.presentScene(particleScene)
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {

    }
}
