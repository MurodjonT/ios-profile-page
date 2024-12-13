import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        collectionView.contentInset.bottom = tabBarController?.tabBar.frame.height ?? 0

    }
    
    private func configureNavigationBar() {
        // Chap taraf: foydalanuvchi rasmi
        let profileImage = UIImage(systemName: "person.crop.circle")
        let profileButton = UIBarButtonItem(image: profileImage,
                                            style: .plain,
                                            target: self,
                                            action: #selector(profileTapped))
        navigationItem.leftBarButtonItem = profileButton
        
        // O'ng taraf: xabar tugmasi
        let notificationImage = UIImage(systemName: "bell")
        let notificationButton = UIBarButtonItem(image: notificationImage,
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(notificationTapped))
                                                 
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchButton = UIBarButtonItem(image: searchImage,
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(searchTapped))
        
        navigationItem.rightBarButtonItems = [notificationButton, searchButton]
    }
    
    @objc private func profileTapped() {
        print("Profile button tapped")
    }
    
    @objc private func notificationTapped() {
        print("Notification button tapped")
    }
    
    @objc private func searchTapped() {
        print("Notification button tapped")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.cornerRadius = 40
        cell.clipsToBounds = true
        
        let imageView = UIImageView(frame: cell.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        cell.addSubview(imageView)

        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = 80
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        header.backgroundColor = .gray
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300)
    }
}
