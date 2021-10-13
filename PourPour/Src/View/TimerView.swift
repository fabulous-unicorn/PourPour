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
    private let timerLabel = UILabel()
    private let completedImageView = UIImageView(image: UIImage(resource: R.image.smile))
    
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
    
    @IBInspectable var timeString: String = "00:00" {
        didSet {
            self.timerLabel.text = timeString
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var isCompleted: Bool = false {
        didSet {
            if isCompleted {
                self.percents = 100
                self.timerLabel.isHidden = true
                self.addCompletedSubView()
            } else {
                self.removeCompletedSubView()
                self.timerLabel.isHidden = false
            }
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.drawProgress()
    }
    
    private func setupView() {
        self.addProgressView()
        self.addBgImage()
        self.addTimerLabel()
    }
    
    
    private func addBgImage() {
        
        self.addSubview(self.bgImageView)
        self.bgImageView.tintColor = self.tintColor
        
        self.bgImageView.translatesAutoresizingMaskIntoConstraints = false
        self.bgImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func addProgressView() {
        
        self.addSubview(self.progressView)
        let limit: CGFloat = 29.0
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: limit).isActive = true
        self.progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * limit).isActive = true
        self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: limit).isActive = true
        self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1 * limit).isActive = true
    }
    
    private func addTimerLabel() {
        
        self.addSubview(self.timerLabel)
        self.timerLabel.font = .monospacedDigitSystemFont(ofSize: 36.0, weight: .bold)
        self.timerLabel.textAlignment = .center
        
        self.timerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func addCompletedSubView() {
        
        self.addSubview(self.completedImageView)
        let limit: CGFloat = 60.0
        self.completedImageView.tintColor = R.color.textPrimary()
        
        self.completedImageView.translatesAutoresizingMaskIntoConstraints = false
        self.completedImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: limit).isActive = true
        self.completedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * limit).isActive = true
        self.completedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: limit).isActive = true
        self.completedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1 * limit).isActive = true
    }
    
    private func removeCompletedSubView() {
        
        self.willRemoveSubview(self.completedImageView)
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
