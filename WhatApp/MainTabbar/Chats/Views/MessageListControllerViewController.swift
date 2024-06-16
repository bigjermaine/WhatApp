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
        cell.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        cell.contentConfiguration = UIHostingConfiguration {
            Text("PLACEHOLDER")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth:.infinity)
                .frame(height:200)
                .background(Color.gray.opacity(0.1))
        }
        return cell
    }
   
}
