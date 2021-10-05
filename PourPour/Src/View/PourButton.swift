//
//  PourButton.swift
//  PourPour
//
//  Created by Alesya on 05.10.2021.
//

import UIKit

enum PureTypeButton: String {
    case primary
    case secondary
    case unknown
}


@IBDesignable
class PourButton: UIButton {
    
    
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
    
    func setupView() {
        self.layer.cornerRadius = 20
        self.tintColor = R.color.controlTypo()
        self.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    // MARK: - Properties
    
    @IBInspectable
    var typeIBProperty: String = "unknown" {
        didSet {
            let type = PureTypeButton(rawValue: typeIBProperty) ?? .unknown
            
            switch type {
            case .primary:
                self.backgroundColor = R.color.controlAccent()
            case .secondary:
                self.backgroundColor = .clear
                self.layer.borderColor =  R.color.controlAccent()?.cgColor
                self.layer.borderWidth = 2.0
            case .unknown:
                print("неизвестный тип кнопки")
            }
        }
    }
}
