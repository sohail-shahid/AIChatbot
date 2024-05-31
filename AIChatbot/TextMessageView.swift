//
//  TextMessageView.swift
//  AIChatbot
//
//  Created by Sohail Khan on 30/05/2024.
//

import SwiftUI

struct TextMessageView: View {
    var viewModel: TextMessageViewModel
    var body: some View {
        let isCurrentUser = viewModel.isCurrentUser
        Text(viewModel.messageText)
            .padding(10)
            .foregroundColor(isCurrentUser ? .white : .black)
            .background(isCurrentUser ? .blue : Color(UIColor.systemGray6))
            .cornerRadius(10)
    }
}

#Preview {
    TextMessageView(viewModel: TextMessageViewModel(message: MessageModel(content: "Hello!", isCurrentUser: true, createdDate: Date())))
}
