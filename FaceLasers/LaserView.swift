/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

struct Laser {
  var origin: CGPoint
  var focus: CGPoint
}

class LaserView: UIView {
  private var lasers: [Laser] = []
  
  func add(laser: Laser) {
    lasers.append(laser)
  }
  
  func clear() {
    lasers.removeAll()
    DispatchQueue.main.async {
      self.setNeedsDisplay()
    }
  }
  
  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
    
    context.saveGState()
    
    for laser in lasers {
      context.addLines(between: [laser.origin, laser.focus])
      
      context.setStrokeColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
      context.setLineWidth(4.5)
      context.strokePath()
      
      context.addLines(between: [laser.origin, laser.focus])
      
      context.setStrokeColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.8)
      context.setLineWidth(3.0)
      context.strokePath()
    }
    
    context.restoreGState()
  }
}
