//
//  LoadingAnimationViewModel.swift
//  WeatherApp
//
//  Created by Tom Golding on 11/5/2024.
//

import Foundation

class LoadingAnimationViewModel: ObservableObject {
    @Published var rotation: Double = 0
    @Published var cornerRadius: Double = 0
    @Published var width: Double = 25
    @Published var height: Double = 25
    private var widthIncrementor: Double = 0.5
    private var heightIncrementor: Double = 0.5
    private var hasIterated: Bool = false
    private var cornerRadiusIncrementor: Double = 0.75
    private var timer: Timer?
    init() {
        
    }
    func startAnimating() -> Void {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.rotateCube()
        }
    }
    func stopAnimating() -> Void{
        self.timer?.invalidate()
    }
    func rotateCube() -> Void {
        self.rotation += 5
        if cornerRadius > 50 {
            cornerRadiusIncrementor = -0.75
        }
        if cornerRadius < 0 {
            cornerRadiusIncrementor = 0.75
        }
        cornerRadius += cornerRadiusIncrementor
    }
}
