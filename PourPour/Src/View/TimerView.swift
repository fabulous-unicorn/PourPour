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
    private let shapeLayer = CAShapeLayer()
    
    @IBInspectable
    var progressColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var timeLabelColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentSecond: Int = 0 {
        didSet {
            changeStateIfNeeds(curentSecond: currentSecond, lastSecond: lastSecond)
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lastSecond: Int = 0 {
        didSet {
            changeStateIfNeeds(curentSecond: currentSecond, lastSecond: lastSecond)
            setNeedsDisplay()
        }
    }
    
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
    
    private func setupView() {
        self.addProgressView()
        self.addBgImage()
        self.addTimerLabel()
        self.progressView.clearsContextBeforeDrawing = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.drawProgress()
    }
    
    private func addBgImage() {
        
        self.addSubview(self.bgImageView)
        self.bgImageView.tintColor = self.tintColor
        self.addAroundEqualAnchor(for: self.bgImageView, equalTo: self, constant: 0)
    }
    
    private func addProgressView() {
        
        self.addSubview(self.progressView)
        self.addAroundEqualAnchor(for: self.progressView, equalTo: self, constant: 29)
        self.progressView.layer.addSublayer(shapeLayer)
    }
    
    private func addTimerLabel() {
        
        self.addSubview(self.timerLabel)
        self.timerLabel.font = .monospacedDigitSystemFont(ofSize: 36.0, weight: .bold)
        self.timerLabel.textAlignment = .center
        self.timerLabel.textColor = self.timeLabelColor
        
        self.timerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func changeStateIfNeeds(curentSecond: Int, lastSecond: Int) {
        
        guard curentSecond >= 0 else {
            fatalError("curentSecond не может быть отрицательным, непредсказуемое поведение")
        }
        
        let remainingSeconds = lastSecond - currentSecond
        self.timerLabel.text = TimeFormaterr.formMinutesTimerString(from: remainingSeconds)
        
        if currentSecond >= lastSecond {
            self.timerLabel.isHidden = true
            self.addCompletedSubView()
        } else {
            self.removeCompletedSubView()
            self.timerLabel.isHidden = false
        }
    }
    
    private func addCompletedSubView() {
        guard !(self.completedImageView.isDescendant(of: self)) else {
            return
        }
        
        self.addSubview(self.completedImageView)
        self.completedImageView.tintColor = self.tintColor
        self.addAroundEqualAnchor(for: self.completedImageView, equalTo: self, constant: 60)
    }
    
    private func removeCompletedSubView() {
        guard self.completedImageView.isDescendant(of: self) else {
            return
        }
        self.completedImageView.removeFromSuperview()
    }
    
    func drawProgress() {
        
        let percents = 100 - self.getPercent(curentSecond: currentSecond, lastSecond: lastSecond)
        
        let viewCenter = CGPoint(x: progressView.bounds.size.width * 0.5, y: progressView.bounds.size.height * 0.5)
        let radius = min(progressView.bounds.size.width, progressView.bounds.size.height) * 0.5
        let startAngle = -0.5 * CGFloat.pi
        let endAngle = startAngle + (percents / 100) * 2 * CGFloat.pi
        
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
        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//
//        shapeLayer.fillColor = self.progressColor.cgColor
//        self.progressView.layer.addSublayer(shapeLayer)

        self.shapeLayer.path = path.cgPath
           
        self.shapeLayer.fillColor = self.progressColor.cgColor
        
    }
    
    private func getPercent(curentSecond: Int, lastSecond: Int) -> CGFloat {
        
        guard currentSecond < lastSecond else { return 100 }
        guard curentSecond > 0 else { return 0 }
        
        return (CGFloat(currentSecond) * 100.0) / CGFloat(lastSecond)
    }
    
    private func addAroundEqualAnchor(for view: UIView, equalTo toView: UIView, constant: CGFloat) {

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: toView.topAnchor, constant: constant).isActive = true
        view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -1 * constant).isActive = true
        view.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: constant).isActive = true
        view.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -1 * constant).isActive = true
    }
}
