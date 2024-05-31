//
//  TextMessageViewModel.swift
//  AIChatbot
//
//  Created by Sohail Khan on 31/05/2024.
//

import UIKit

struct TextMessageViewModel {
    let message: MessageModel
    var isCurrentUser: Bool {
        message.isCurrentUser
    }
    var messageText: String {
        message.content
    }
}
