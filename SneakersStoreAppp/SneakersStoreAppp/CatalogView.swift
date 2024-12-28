//
//  CatalogView.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

protocol CatalogViewDelegate: AnyObject {
    func didSelectProduct(_ product: Product)
}

class CatalogView: UIViewController {
    
    weak var delegate: CatalogViewDelegate?
    weak var cartViewController: CartViewController?
    // MARK: - Properties
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Colors.backGroundCatalog
       // collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let titleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 17)
            label.textColor = .black
            label.text = "Hello, Sneakerhead!"
            return label
        }()
    
    private var products: [Product] = []
    private var cart: [Product] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.backGroundCatalog
        setupViews()
        loadProducts()
        setupTitleLabel()
    }
    
    // MARK: - View Setup
    
    private func setupTitleLabel() {
            view.addSubview(titleLabel)
            
        titleLabel.anchor(top: self.view.safeAreaLayoutGuide.topAnchor , left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: -100)
        }
        
    
    private func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        view.addSubview(collectionView)
        

        
        collectionView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: -50, paddingLeft: 16, paddingRight: 16)
        
    }
    
    // MARK: - Product Loading
    
    private func loadProducts() {

        products = [
            Product(title: "Dolce & Gabbana", definition: "Кеды с принтом граффити", image: UIImage(named: "cat1"), price: "$1251", isAddedToCart: false),
                    Product(title: "Off-White", definition: "Кроссовки Off-Court 3.0", image: UIImage(named: "cat2"), price: "1 • $551", isAddedToCart: false),
                    Product(title: "Jordan", definition: "Кеды с принтом граффити", image: UIImage(named: "cat3"), price: "$1251", isAddedToCart: false),
                    Product(title: "Jordan", definition: "Кеды с принтом граффити", image: UIImage(named: "cat4"), price: "$1251", isAddedToCart: false),
                    Product(title: "Jordan", definition: "Кеды с принтом граффити", image: UIImage(named: "cat4"), price: "$1251", isAddedToCart: false),
                    Product(title: "Jordan", definition: "Кеды с принтом граффити", image: UIImage(named: "cat3"), price: "$1251", isAddedToCart: false)
        ]
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension CatalogView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.item]
        cell.titleLabel.text = product.title
        cell.definitonLabel.text = product.definition
        cell.imageView.image = product.image
        cell.priceLabel.text = product.price
        cell.addButtonTapped = { [weak self] in
            guard let self = self else { return }
            let product = self.products[indexPath.item]
            if !product.isAddedToCart {
                self.cart.append(product)
            } else {
                if let index = self.cart.firstIndex(of: product) {
                    self.cart.remove(at: index)
                }
            }
            self.products[indexPath.item].isAddedToCart.toggle()
            self.collectionView.reloadItems(at: [indexPath])
            self.updateCartBadge()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let product = products[indexPath.item]
            delegate?.didSelectProduct(product)
        cartViewController?.didSelectProduct(product)
        }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CatalogView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let availableWidth = collectionView.frame.width - padding
        let itemWidth = availableWidth / 2
        let itemHeight: CGFloat = 282
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension CatalogView {
    private func updateCartBadge() {
        // Implement your logic to update the cart badge here
        // You can access the cart count using `cart.count` property
    }
}
































//import UIKit
//
//class CatalogView: UIViewController {
//
//    private let logoutButton = CustomButton(title: "Log out" , backgroundColor: Colors.generalButton, cornerRadius: 25, font: .systemFont(ofSize: 17))
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .blue
//        setUI()
//        setActions()
//
//    }
//
//    private func setUI() {
//        [logoutButton].forEach {self.view.addSubview($0)}
//        logoutButton.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingLeft: 16, paddingBottom: 58, paddingRight: 16, height: 54)
//    }
//
//
//    private func setActions() {
//        self.logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
//    }
//
//
//
//    @objc private func didTapLogout() {
//            AuthService.shared.signOut { [weak self] error in
//                guard let self = self else { return }
//                if let error = error {
//                    AlertManager.showLogoutError(on: self, with: error)
//                    return
//                }
//
//                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
//                    sceneDelegate.checkAuthentication()
//                }
//            }
//        }
//}
