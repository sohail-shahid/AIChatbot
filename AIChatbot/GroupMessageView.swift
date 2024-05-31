//
//  GroupMessageView.swift
//  AIChatbot
//
//  Created by Sohail Khan on 30/05/2024.
//

import SwiftUI

struct GroupMessageView: View {
    var viewModel: GroupMessageViewModel
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if viewModel.isCurrentUser {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            TextMessageView(viewModel: TextMessageViewModel(message: viewModel.message))
        }
        .background(.clear)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    GroupMessageView(viewModel: GroupMessageViewModel(message: MessageModel(content: "Hello", isCurrentUser: true, createdDate: Date())))
}
