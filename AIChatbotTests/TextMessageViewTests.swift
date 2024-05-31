//
//  TextMessageViewTests.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import AIChatbot

final class TextMessageViewTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_textMessageView_forCurrentUser() throws {
        let messageModel = MessageModel(content: "Hello, World!", isCurrentUser: true, createdDate: Date())
        let viewModel = TextMessageViewModel(message: messageModel)
        let stub = TextMessageView(viewModel: viewModel)

        let textView = try stub.inspect().text()
        let background = try textView.background().find(ViewType.Color.self).value()

        XCTAssertEqual(try textView.string(), messageModel.content)
        XCTAssertEqual(try textView.attributes().foregroundColor(), .white)
        XCTAssertEqual(background, Color.blue)
    }
    
    func test_textMessageView_forOtherUser() throws {
        let messageModel = MessageModel(content: "Hello, World!", isCurrentUser: false, createdDate: Date())
        let viewModel = TextMessageViewModel(message: messageModel)
        let stub = TextMessageView(viewModel: viewModel)
        
        let textView = try stub.inspect().text()
        let background = try textView.background().find(ViewType.Color.self).value()
        
        XCTAssertEqual(try textView.string(), messageModel.content)
        XCTAssertEqual(try textView.attributes().foregroundColor(), .black)
        XCTAssertEqual(background, Color(UIColor.systemGray6))
    }
}
