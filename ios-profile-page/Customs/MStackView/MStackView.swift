
import UIKit

public class MStackView: UIStackView {
    
    private let containerView = UIView()
    public init(axis: NSLayoutConstraint.Axis,
                distribution: UIStackView.Distribution = .fill,
                alignment: UIStackView.Alignment = .fill,
                spacing: CGFloat = 8) {
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = true
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
