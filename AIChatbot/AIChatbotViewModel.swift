//
//  AIChatbotViewModel.swift
//  AIChatbot
//
//  Created by Sohail Khan on 31/05/2024.
//

import Foundation
import GoogleGenerativeAI
import Combine


protocol GenerativeModelProtocol {
    func generateContent(_ parts: any ThrowingPartsRepresentable...) async throws -> GenerateContentResponse
}
extension GenerativeModel: GenerativeModelProtocol {}

class AIChatbotViewModel: ObservableObject {
    var generativeModel: GenerativeModelProtocol = GenerativeModel(name: "gemini-pro", apiKey: "Place_API_KEY")
    @Published var messageList: [MessageModel] = []
    @Published var isGenerating: Bool = false
    
    @MainActor 
    func submit(question: String) {
        isGenerating = true
        let message = MessageModel(content: question, isCurrentUser: true, createdDate: Date())
        messageList.append(message)
        Task {
                do {
                    let generatedResponse = try await generativeModel.generateContent(question)
                    let answer = generatedResponse.text ?? "Sorry, Gemini got some problems.\nPlease try again later."
                    let response = MessageModel(content: answer, isCurrentUser: false, createdDate: Date())
                    messageList.append(response)
                } catch {}
                isGenerating = false
            }
    }
}
