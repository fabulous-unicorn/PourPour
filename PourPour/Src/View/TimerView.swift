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
        self.addAroundEqualAnchor(for: self.bgImageView, equalTo: self, constant: 0)
    }
    
    private func addProgressView() {
        
        self.addSubview(self.progressView)
        self.addAroundEqualAnchor(for: self.progressView, equalTo: self, constant: 29)
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
        self.completedImageView.tintColor = R.color.textPrimary()
        self.addAroundEqualAnchor(for: self.completedImageView, equalTo: self, constant: 60)
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
    
    private func addAroundEqualAnchor(for view: UIView, equalTo toView: UIView, constant: CGFloat) {

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: toView.topAnchor, constant: constant).isActive = true
        view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -1 * constant).isActive = true
        view.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: constant).isActive = true
        view.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -1 * constant).isActive = true
    }
}
