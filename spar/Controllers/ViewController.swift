//
//  ViewController.swift
//  spar
//
//  Created by Admin on 11.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let locationView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 18.0
        view.layer.borderColor = UIColor.secondarySystemFill.cgColor
        view.layer.borderWidth = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.identifier)
        tableView.register(PromoTableViewCell.self, forCellReuseIdentifier: PromoTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = false
        label.sizeToFit()
        label.text = "Москва, Москва и Московская область"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func addConstarints() {
        let leftViewImage = UIImageView(image: UIImage(named: "location"))
        leftViewImage.translatesAutoresizingMaskIntoConstraints = false
        locationView.addSubview(locationLabel)
        locationView.addSubview(leftViewImage)
        leftViewImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        leftViewImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        locationView.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -10).isActive = true
        locationView.bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        leftViewImage.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -8).isActive = true
        leftViewImage.centerYAnchor.constraint(equalTo: locationView.centerYAnchor).isActive = true
        locationView.leadingAnchor.constraint(equalTo: leftViewImage.leadingAnchor, constant: -10).isActive = true
        locationView.trailingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Main"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    
        addConstarints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .done , target: self, action: nil)
        navigationController?.navigationBar.topItem?.titleView = locationView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
             cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.identifier, for: indexPath) as! StoriesTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: PromoTableViewCell.identifier, for: indexPath) as! PromoTableViewCell
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        }
        
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}


