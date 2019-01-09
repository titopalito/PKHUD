//
//  PKHUDStaticImageView.swift
//  PKHUD
//
//  Created by andres paladines on 1/9/19.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDSquareBaseView provides a square view, which you can subclass and add additional views to.
open class PKHUDStaticImageView: UIView {
    
    static let defaultSquareBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 300.0, height: 356.0))
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(image: UIImage? = nil, title: String? = nil, subtitle: String? = nil) {
        super.init(frame: PKHUDStaticImageView.defaultSquareBaseViewFrame)
        let img = image?.withRenderingMode(.alwaysTemplate)
        self.imageView.image = img
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.85
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.textColor = UIColor.black.withAlphaComponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
        return label
    }()
    
    public let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
        return label
    }()
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = PKHUD.sharedHUD.leadingMargin + PKHUD.sharedHUD.trailingMargin
        let originX: CGFloat = margin > 0 ? margin : 0.0
        let viewWidth = bounds.size.width - 2 * margin
        let viewHeight = bounds.size.height
        
        let sixthHeight = CGFloat(ceilf(CFloat(viewHeight / 6.0)))
        let dirdHeight = CGFloat(ceilf(CFloat(viewHeight / 2.5)))
        let threeSixthHeight = sixthHeight + dirdHeight
        
        titleLabel.frame = CGRect(origin: CGPoint(x: originX, y: 0.0), size: CGSize(width: viewWidth, height: sixthHeight))
        imageView.frame = CGRect(origin: CGPoint(x: originX, y: sixthHeight), size: CGSize(width: viewWidth, height: dirdHeight))
        subtitleLabel.frame = CGRect(origin: CGPoint(x: originX, y: threeSixthHeight), size: CGSize(width: viewWidth, height: dirdHeight))
        subtitleLabel.backgroundColor = .cyan
    }
}
