//
//  ChatPartnerPickerViewModel.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import Foundation

enum ChannelCreateRoute{
    case addGroupChat
    case setupGroupChat
}
final class ChatPartnerPickerViewModel:ObservableObject {

  @Published var navStack = [ChannelCreateRoute]()
  @Published var selectedChatPatterners = [UserItem]()

  var showSelectedUsers:Bool {
    return selectedChatPatterners.isEmpty
  }

  //Mark: Public Methods
  func handleItemSelction(_ user: UserItem)  {
    if isUserSelected(user) {
      guard let index = selectedChatPatterners.firstIndex(where: $0.uid = user.id) else {return}
      selectedChatPatterners.remove(at: index)

    }else {
      selectedChatPatterners.append(user)
    }
  }
  func isUserSelected(_ user: UserItem) -> Bool {
    let isSelected = selectedChatPatterners.contains(where: $0.uid = user.id)
    return isSelected
  }

}

