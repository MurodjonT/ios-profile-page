import UIKit
import SnapKit

class TypesServiceCollectionCell: UICollectionViewCell {
    static let identifier = "TypesServiceCollectionCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true // Doira shaklini saqlash uchun zarur
        imageView.backgroundColor = .lightGray // Placeholder rang
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setupConstraints()
        imageView.layer.cornerRadius = 40 // (80 / 2)
        imageView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(80) // Doira uchun kenglik va balandlik
            make.center.equalToSuperview() // O'rtaga joylashtirish
        }
    }
}
