//
//  AIChatbotView.swift
//  AIChatbot
//
//  Created by Sohail Khan on 30/05/2024.
//

import SwiftUI

struct AIChatbotView: View {
    @State var inputText: String = ""
    @ObservedObject var viewModel: AIChatbotViewModel = AIChatbotViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(viewModel.messageList) { message in
                        GroupMessageView(viewModel: GroupMessageViewModel(message: message))
                    }
                    .listRowSeparator(.hidden)
                }
                .toolbar {
                }
                HStack {
                    TextField("Type your question here", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        viewModel.submit(question: inputText)
                        inputText = ""
                    } label:  {
                        Image(systemName: "paperplane")
                    }
                    .disabled(viewModel.isGenerating)
                }
                .padding()
            }
        }
    }
}

#Preview {
    AIChatbotView()
        .modelContainer(for: Item.self, inMemory: true)
}
