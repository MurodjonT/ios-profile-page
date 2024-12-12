import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    
    var innerCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        
        layout.minimumInteritemSpacing = 0// Elementlar orasida vertikal bo'shliq
        layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
        
        innerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        innerCollectionView.backgroundColor = .gray
        innerCollectionView.dataSource = self
        innerCollectionView.delegate = self
        innerCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "innerCell")
        
        self.addSubview(innerCollectionView)
        
        innerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.height.equalTo(150)
            make.left.right.equalToSuperview()        }
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
        return 5 // Inner collectionda 5 dona element
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerCell", for: indexPath)
        

        cell.layer.cornerRadius = 45
        cell.clipsToBounds = true
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.backgroundColor = .green
        
        
        let imageView = UIImageView(frame: cell.bounds)
              imageView.contentMode = .scaleAspectFill
              imageView.image = UIImage(named: "soon-\(indexPath.item + 1)")
              cell.addSubview(imageView)
        
        return cell
    }
    
    // O'lchamni belgilash
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = 90
        return CGSize(width: itemWidth, height: itemWidth) // O'lchamni 100x100 qilib belgilaymiz
    }
 }

