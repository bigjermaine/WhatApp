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
        return MessageItem.stubMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let message = MessageItem.stubMessages[indexPath.row]
        cell.contentConfiguration = UIHostingConfiguration {
            BubbleTextView(item: message)
            switch message.type {
            case.photo:
                BubbleImageView(item: message)
            case.text:
                BubbleTextView(item: message)
            case.video:
                BubbleTextView(item: message)
            case.audio:
                BubbleAudioView(item: message)
            }
            
        }
        return cell
    }
   
}

#Preview {
  MessageListView()
}
