//
//  TextMessageViewModelTests.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import XCTest
@testable import AIChatbot

final class TextMessageViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_messageModel() {
        let message = MessageModel(content: "Hello", isCurrentUser: true, createdDate: Date())
        let viewModel = TextMessageViewModel(message: message)
        XCTAssertEqual(viewModel.messageText, message.content)
        XCTAssertEqual(viewModel.isCurrentUser, message.isCurrentUser)
    }
    
    func test_isCurrentUser() {
        let currentUserMessage = MessageModel(content: "Hello", isCurrentUser: true, createdDate: Date())
        let otherUserMessage = MessageModel(content: "Hi", isCurrentUser: false, createdDate: Date())
        let currentUserViewModel = TextMessageViewModel(message: currentUserMessage)
        let otherUserViewModel = TextMessageViewModel(message: otherUserMessage)
        XCTAssertTrue(currentUserViewModel.isCurrentUser)
        XCTAssertFalse(otherUserViewModel.isCurrentUser)
    }
    
    func test_messageText_shouldBeEqualToMessageContent() {
        let messageContent = "Test message content"
        let message = MessageModel(content: messageContent, isCurrentUser: true, createdDate: Date())
        let viewModel = TextMessageViewModel(message: message)
        XCTAssertEqual(viewModel.messageText, messageContent)
    }
    
}

