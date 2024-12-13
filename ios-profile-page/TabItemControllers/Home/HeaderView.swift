import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    
    var innerCollectionView: UICollectionView!
    let quickServicesView = QuickServicesView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        innerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        innerCollectionView.backgroundColor = .gray
        innerCollectionView.dataSource = self
        innerCollectionView.delegate = self
        innerCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "innerCell")
        quickServicesView.backgroundColor = .gray
        addSubview(innerCollectionView)
        addSubview(quickServicesView)
        
        
        innerCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(130)
            make.left.right.equalToSuperview()
        
        }
        
        quickServicesView.snp.makeConstraints { make in
            make.top.equalTo(innerCollectionView.snp.bottom).offset(-10)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerCell", for: indexPath)
        
        // UIImageView
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "soon-\(indexPath.item + 1)")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 45
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.orange.cgColor
        cell.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(-10)
            make.width.height.equalTo(90) // Kvadrat o'lcham, cornerRadius bilan dumaloq bo'ladi
        }
        
        // UILabel
        let titleLabel = UILabel()
        titleLabel.text = "Title \(indexPath.item + 1)"
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        cell.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(5)
        }
        
        return cell
    }
    
    // O'lchamni belgilash
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = 90
        return CGSize(width: itemWidth, height: itemWidth) // O'lchamni 100x100 qilib belgilaymiz
    }
 }

