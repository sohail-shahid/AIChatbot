//
//  GroupMessageViewModel.swift
//  AIChatbot
//
//  Created by Sohail Khan on 31/05/2024.
//

import Foundation

struct GroupMessageViewModel {
    let message: MessageModel
    var isCurrentUser: Bool {
        message.isCurrentUser
    }
}
