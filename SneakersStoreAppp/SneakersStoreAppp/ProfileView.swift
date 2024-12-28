//
//  ProfileView.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class ProfileView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let listData = ["Account Information", "Order History", "Shoe Size"]
    

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .gray
               tableView.separatorStyle = .none
  
        view.addSubview(tableView)
        tableView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor)
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
            
          
            cell.titleLabel.text = listData[indexPath.row]
            
            if indexPath.row == 0 {
                cell.contentView.layoutMargins.left = 20
            } else {
                cell.contentView.layoutMargins.left = 0
            }
            
            return cell
       }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        
        switch indexPath.row {
        case 0:
            let accountInfoVC = AccountInfoView()
            navigationController?.pushViewController(accountInfoVC, animated: true)
        case 1:
            let orderHistoryVC = HistoryView()
            navigationController?.pushViewController(orderHistoryVC, animated: true)
        default:
            break
        }
    }
}

class CustomTableViewCell: UITableViewCell {
    let chevronImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        chevronImageView.image = UIImage(systemName: "chevron.right")
        chevronImageView.tintColor = .gray
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .white
        
        contentView.addSubview(chevronImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
                    chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    
                    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
                ])
                
                let spacingConstraint = titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
                spacingConstraint.priority = .defaultLow
                spacingConstraint.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
