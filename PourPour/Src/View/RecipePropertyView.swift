//
//  RecipePropertyView.swift
//  PourPour
//
//  Created by Alesya on 06.10.2021.
//

import UIKit

@IBDesignable
class RecipePropertyView: UIStackView {
    
    let iconImageView = UIImageView()
    let valueLabelView = UILabel()
    let suffixLabelView = UILabel()
    
    @IBInspectable var iconImage: UIImage = UIImage() {
        didSet {
            self.iconImageView.image = iconImage
        }
    }
    
    @IBInspectable var valueLabel: String = "" {
        didSet {
            self.valueLabelView.text = valueLabel
        }
    }
    
    @IBInspectable var suffixLabel: String = "" {
        didSet {
            self.suffixLabelView.text = suffixLabel
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - UI Setup
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        
        self.frame = bounds
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.axis = .horizontal
        self.alignment = .bottom
        self.distribution = .equalSpacing
        self.spacing = 4.0
        
        self.setImageView()
        self.setValueLabelView()
        self.setSuffixLabelView()
        
        self.addConstraint()
        self.sizeToFit()
        self.layoutIfNeeded()
    }
    
    func setImageView() {
        
        self.addArrangedSubview(self.iconImageView)
        self.iconImageView.tintColor = R.color.controlIconBg()
    }
    
    
    func setValueLabelView() {
        
        self.addArrangedSubview(self.valueLabelView)
        
        self.valueLabelView.font = .systemFont(ofSize: 20, weight: .semibold)
        self.valueLabelView.textColor = R.color.textPrimary()
    }
    
    
    func setSuffixLabelView() {
        
        self.addArrangedSubview(self.suffixLabelView)
        
        self.suffixLabelView.font = .systemFont(ofSize: 16, weight: .regular)
        self.suffixLabelView.textColor = R.color.textSecondary()
        
        if self.suffixLabel != "" {
            self.suffixLabelView.isHidden = true
        } else {
            self.suffixLabelView.isHidden = false
        }
    }
    

    func addConstraint() {
        
        //image
//        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint(item: self.iconImageView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 2).isActive = true
//
//        NSLayoutConstraint(item: self.iconImageView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 2).isActive = true
        
        NSLayoutConstraint(item: self.iconImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 24).isActive = true
        
        NSLayoutConstraint(item: self.iconImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 24).isActive = true
    }

}
