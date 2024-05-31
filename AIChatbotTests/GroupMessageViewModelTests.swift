//
//  GroupMessageViewModelTests.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import XCTest
@testable import AIChatbot

final class GroupMessageViewModelTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
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
}
