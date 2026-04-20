//
//  WaveFormView.swift
//  Squillio
//
//  Created by Gourav Joshi on 16/08/25.
//

import UIKit

final class WaveFormView: UIView {
  
  // MARK: Tunables
  var numberOfBars: Int = 28 {
    didSet {
      levels = Array(repeating: minLevel, count: numberOfBars)
    }
  }
  var barWidth: CGFloat = 3
  var spacing: CGFloat = 3
  var barColor: UIColor = .blue
  var barCornerRadius: CGFloat = 1.5
  private let minLevel: CGFloat = 0.02   // tiny baseline so it never disappears
  private let gain: CGFloat = 10.0        // boost if your mic levels look small
  
  // MARK: State
  private var levels: [CGFloat] = []
  private var lastLevel: CGFloat = 0
  
  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  private func commonInit() {
    isOpaque = true
    backgroundColor = .white            // <- fixes “black background”
    contentMode = .redraw
    levels = Array(repeating: minLevel, count: numberOfBars)
  }
  
  /// Call this on your timer with the **raw dB** from AVAudioRecorder.averagePower(forChannel:)
  func update(with decibels: Float) {
    // dB (-160...0) -> linear (0...1)
    let linear = max(0, min(1, CGFloat(pow(10.0, Double(decibels) / 20.0))))
    // smooth to avoid jitter
    let smoothed = lastLevel * 0.6 + linear * 0.4
    lastLevel = smoothed
    
    // boost & clamp
    let level = max(minLevel, min(1, smoothed * gain))
    
    // scroll left: push new, drop oldest
    levels.append(level)
    if levels.count > numberOfBars { levels.removeFirst() }
    
    setNeedsDisplay()
  }
  
  override func draw(_ rect: CGRect) {
    guard let ctx = UIGraphicsGetCurrentContext() else { return }
    
    // Fill background (prevents any dark/transparent look)
    ctx.setFillColor(UIColor.white.cgColor)
    ctx.fill(rect)
    
    // Center the strip of bars
    let totalWidth = CGFloat(numberOfBars) * barWidth + CGFloat(numberOfBars - 1) * spacing
    var x = (rect.width - totalWidth) / 2.0
    let midY = rect.midY
    let availableH = rect.height - 4    // small vertical padding
    
    for lvl in levels {
      // ← THIS is the barHeight line you asked about
      let barHeight = max(2, lvl * availableH * 2.5)
      let barRect = CGRect(x: x, y: midY - barHeight/2, width: barWidth, height: barHeight)
      UIBezierPath(roundedRect: barRect, cornerRadius: barCornerRadius).fill(with: .normal, alpha: 1.0)
      barColor.setFill()
      x += barWidth + spacing
    }
  }
  
  func resetWaveformAnimated() {
    DispatchQueue.global().async {
      for i in stride(from: 1.0, to: 0.0, by: -0.1) {
        DispatchQueue.main.async {
          self.levels = self.levels.map { max(self.minLevel, $0 * CGFloat(i)) }
          self.setNeedsDisplay()
        }
        Thread.sleep(forTimeInterval: 0.05)
      }
    }
  }
}

