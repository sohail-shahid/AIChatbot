//
//  MockGenerativeModel.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import Foundation
import GoogleGenerativeAI
@testable import AIChatbot


struct MockGenerativeModel: GenerativeModelProtocol {
    var shouldThrowError: Bool = false
    func generateContent(_ parts: any GoogleGenerativeAI.ThrowingPartsRepresentable...) async throws -> GoogleGenerativeAI.GenerateContentResponse {
        if shouldThrowError {
            throw NSError()
        }
        return GenerateContentResponse(candidates: [])
    }
}
