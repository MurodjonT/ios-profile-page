import UIKit
import SnapKit

final class StoryCollectionViewCell: UICollectionViewCell {
    // UIImageView yaratamiz
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // UIImageViewni contentViewga qo‘shamiz
        contentView.addSubview(cellImageView)
        
        // SnapKit yordamida constraintlarni o‘rnatamiz
        cellImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Superview (contentView) ga barcha tomonlardan bir xil masofa
        }
    }
    
    // Tasvirni va burchak radiusini sozlash uchun metod
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
}
