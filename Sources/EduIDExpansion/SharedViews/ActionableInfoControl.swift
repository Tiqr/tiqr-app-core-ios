import UIKit
import TinyConstraints

class ActionableInfoControl: UIControl {

    init(attributedTitle: NSAttributedString? = nil, attributedBodyText: NSAttributedString, iconInTitle: UIImage? = nil, iconInBody: UIImage? = nil, isFilled: Bool, shadow: Bool = false) {
        super.init(frame: .zero)
                
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: set height
        attributedTitle != nil ? height(105) : height(70)
        
        //MARK: the title label
        let titleLabel = UILabel()
        titleLabel.height(35)
        titleLabel.attributedText = attributedTitle
        
        //MARK: the control view
        let view = UIView()
        view.height(70)
        view.backgroundColor = .white
        if shadow {
            view.setShadow(opacity: 0.2, color: .black, radius: 2, offset: CGSize(width: 2, height: 2))
        }
        view.layer.cornerRadius = 6
        view.layer.borderWidth = isFilled ? 3 : 1
        view.layer.borderWidth = shadow ? 1 : view.layer.borderWidth
        view.layer.borderColor = isFilled ? UIColor.backgroundColor.cgColor : UIColor.disabledGray.cgColor
        let bodyLabel = UILabel()
        bodyLabel.numberOfLines = 0
        bodyLabel.attributedText = attributedBodyText
        let iconInBodyView = UIImageView(image: iconInBody)
        let colorAttribute = attributedBodyText.attributes(at: 0, effectiveRange: nil)[.foregroundColor]
        iconInBodyView.tintColor = colorAttribute as? UIColor
        iconInBodyView.width(30)
        iconInBodyView.height(30)
        iconInBodyView.contentMode = .scaleAspectFit
        let bodyStack = UIStackView(arrangedSubviews: [bodyLabel, iconInBodyView])
        bodyStack.translatesAutoresizingMaskIntoConstraints = false
        bodyStack.axis = .horizontal
        bodyStack.spacing = 12
        bodyStack.alignment = .center
        bodyStack.distribution = .equalSpacing
        iconInBodyView.isHidden = iconInBody == nil
        view.addSubview(bodyStack)
        bodyStack.edges(to: view, insets: TinyEdgeInsets(top: 6, left: 18, bottom: 6, right: 18))
        
        //MARK: - super stack
        let stack = UIStackView(arrangedSubviews: [titleLabel, view])
        stack.isUserInteractionEnabled = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isHidden = attributedTitle == nil
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .equalSpacing
        addSubview(stack)
        stack.edges(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
