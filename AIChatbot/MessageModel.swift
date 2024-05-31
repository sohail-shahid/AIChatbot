//
//  MessageModel.swift
//  AIChatbot
//
//  Created by Sohail Khan on 30/05/2024.
//

import Foundation

struct MessageModel: Identifiable {
    var id = UUID()
    var content: String
    var isCurrentUser: Bool
    var createdDate: Date
}
