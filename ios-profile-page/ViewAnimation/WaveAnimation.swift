//
//  WaveAnimation.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 04/12/24.
//

import UIKit

class WaveAnimationView: UIView {
    
    private var waveLayer1 = CAShapeLayer()
    private var waveLayer2 = CAShapeLayer()
    private var displayLink: CADisplayLink?
    private var phase1: CGFloat = 0
    private var phase2: CGFloat = 0
    
    // Properties to configure the waves
    var waveSpeed: CGFloat = 0.1
    var waveAmplitude1: CGFloat = 20.0
    var waveFrequency1: CGFloat = 2.0
    var waveHeight1: CGFloat = 30.0
    var waveColor: UIColor = .cyan
    
    var waveAmplitude2: CGFloat = 20.0
    var waveFrequency2: CGFloat = 2.0
    var waveHeight2: CGFloat = 30.0
    
    init(waveColor: UIColor) {
        super.init(frame: .zero)
        self.waveColor = waveColor
        setupWaveLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWaveLayers()
    }
    
    private func setupWaveLayers() {
        waveLayer1.fillColor = waveColor.cgColor
        layer.addSublayer(waveLayer1)
        
        waveLayer2.fillColor = waveColor.withAlphaComponent(0.3).cgColor
        layer.addSublayer(waveLayer2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        waveLayer1.frame = bounds
        waveLayer2.frame = bounds
    }
    
    func startAnimating() {
        stopAnimating()
        displayLink = CADisplayLink(target: self, selector: #selector(updateWaves))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    func stopAnimating() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func updateWaves() {
        phase1 += waveSpeed
        phase2 += waveSpeed * 0.5 // Different speed for the second wave
        waveLayer1.path = wavePath(phase: phase1, amplitude: waveAmplitude1, frequency: waveFrequency1).cgPath
        waveLayer2.path = wavePath(phase: phase2, amplitude: waveAmplitude2, frequency: waveFrequency2).cgPath
    }
    
    private func wavePath(phase: CGFloat, amplitude: CGFloat, frequency: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        let width = bounds.width
        let height = bounds.height
        path.move(to: CGPoint(x: 0, y: height / 2))
        
        for x in stride(from: 0, to: width, by: 1) {
            let y = amplitude * sin((frequency * x + phase) * .pi / 180)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        
        return path
    }
    
    func reSetColors(color: UIColor) {
        waveLayer1.fillColor = color.cgColor
        waveLayer2.fillColor = color.withAlphaComponent(0.3).cgColor
    }
    
    deinit {
        stopAnimating()
    }
}
