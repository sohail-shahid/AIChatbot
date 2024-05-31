//
//  MessageModelTests.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import XCTest
@testable import AIChatbot

final class MessageModelTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_messageModelInitialization() {
        let content = "Test Message"
        let isCurrentUser = true
        let createdDate = Date()
        let message = MessageModel(content: content, isCurrentUser: isCurrentUser, createdDate: createdDate)
        
        XCTAssertEqual(message.content, content)
        XCTAssertEqual(message.isCurrentUser, isCurrentUser)
        XCTAssertEqual(message.createdDate, createdDate)
    }
    
    func test_messageModelUniqueness() {
        let content = "Test Message"
        let isCurrentUser = true
        let createdDate = Date()
        let message1 = MessageModel(content: content, isCurrentUser: isCurrentUser, createdDate: createdDate)
        let message2 = MessageModel(content: content, isCurrentUser: isCurrentUser, createdDate: createdDate)
        XCTAssertNotEqual(message1.id, message2.id)
    }
}

