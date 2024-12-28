//
//  CartView.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class CartViewController: UIViewController, CatalogViewDelegate {

    var selectedProducts: [Product] = []

    func didSelectProduct(_ product: Product) {
        selectedProducts.append(product)
        tableView.reloadData()
        updateTotalPrice()
    }

    private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()
        
    override var title: String? {
            didSet {
                titleLabel.text = title
            }
        }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CartItemCell.self, forCellReuseIdentifier: "CartItemCell")
        return tableView
    }()

    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .right
        return label
    }()

    private let confirmOrderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm Order", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Cart"
        setupViews()
 
    }

    private func setupViews() {
        let catalogView = CatalogView()
        catalogView.delegate = self

        tableView.dataSource = self
        tableView.delegate = self

        [tableView, totalPriceLabel, confirmOrderButton].forEach { self.view.addSubview($0) }
        
        tableView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor)
        
        confirmOrderButton.anchor(top: tableView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor)

        confirmOrderButton.addTarget(self, action: #selector(confirmOrderButtonTapped), for: .touchUpInside)
    }

    private func updateTotalPrice() {
        let totalPrice = selectedProducts.reduce(0) { $0 + Double($1.price.replacingOccurrences(of: "$", with: ""))! }
        totalPriceLabel.text = "Total Price: $\(totalPrice)"
    }

    @objc private func confirmOrderButtonTapped() {
        let alertController = UIAlertController(title: "Confirm Order", message: "Are you sure you want to confirm?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.showSuccessfulOrder()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc func stepperValueChanged(_ stepper: UIStepper) {

    }
    
    private func showSuccessfulOrder() {
        let modalViewController = SuccessfulOrderViewController()
        modalViewController.modalPresentationStyle = .automatic
        present(modalViewController, animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        let item = selectedProducts[indexPath.row]
        cell.titleLabel.text = item.title
        cell.priceLabel.text = item.price
        cell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        cell.removeButtonTapped = { [weak self] in
            guard let self = self else { return }
            if let index = self.selectedProducts.firstIndex(of: item) {
                self.selectedProducts.remove(at: index)
                tableView.reloadData()
                self.updateTotalPrice()
            }
        }
        return cell
    }
}

extension CartViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
