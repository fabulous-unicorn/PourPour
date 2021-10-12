//
//  TimerView.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import UIKit

@IBDesignable
class TimerView: UIView {
    
    private let bgImageView = UIImageView(image: UIImage(resource: R.image.bigTimer))
    private let progressView = UIView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - UI Setup
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    @IBInspectable
    var progressColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }
 
    @IBInspectable var percents: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.drawProgress()
    }
    
    private func setupView() {
        self.setProgressView()
        self.setBgImage()
    }
    
    
    private func setBgImage() {
        
        self.addSubview(self.bgImageView)
        bgImageView.tintColor = self.tintColor
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: self.bgImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self.bgImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self.bgImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self.bgImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        
        self.addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
    
    private func setProgressView() {
        
        self.addSubview(self.progressView)
        let limit: CGFloat = 29.0
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: self.progressView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: limit)
        let bottomConstraint = NSLayoutConstraint(item: self.progressView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -1 * limit)
        let leadingConstraint = NSLayoutConstraint(item: self.progressView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: limit)
        let trailingConstraint = NSLayoutConstraint(item: self.progressView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -1 * limit)
        self.addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])

    }
    
    func drawProgress() {
        
        let viewCenter = CGPoint(x: progressView.bounds.size.width * 0.5, y: progressView.bounds.size.height * 0.5)
        let radius = min(progressView.bounds.size.width, progressView.bounds.size.height) * 0.5
        let startAngle = -0.5 * CGFloat.pi
        let endAngle = startAngle + (self.percents / 100) * 2 * CGFloat.pi
        
        let path = UIBezierPath()
        path.move(to: viewCenter)
        path.addLine(to: CGPoint(x: viewCenter.x,
                                 y: viewCenter.y - radius))
        path.addArc(withCenter: viewCenter,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true)
        path.addLine(to: viewCenter)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
           
        shapeLayer.fillColor = self.progressColor.cgColor
        self.progressView.layer.addSublayer(shapeLayer)

    }
}
