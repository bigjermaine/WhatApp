//
//  MessageListControllerViewController.swift
//  WhatApp
//
//  Created by MacBook AIR on 16/06/2024.
//

import UIKit
import SwiftUI
class MessageListControllerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
let cellIdentifier = "cell1"
    private lazy var tableView:UITableView =  {
        let tableView = UITableView()
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:cellIdentifier )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.contentConfiguration = UIHostingConfiguration {
            BubbleTextView(item: .receivePlaceHolder)
        }
        return cell
    }
   
}
