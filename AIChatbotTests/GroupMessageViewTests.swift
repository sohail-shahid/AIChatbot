//
//  GroupMessageViewTests.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import AIChatbot

final class GroupMessageViewTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_groupMessageView_forCurrentUser() throws {
        
        let messageModel = MessageModel(content: "Hello, World!", isCurrentUser: true, createdDate: Date())
        let viewModel = GroupMessageViewModel(message: messageModel)
        let view = GroupMessageView(viewModel: viewModel)
        
        let hStack = try view.inspect().hStack()
        let image = try hStack.image(0)
        let textMessageView = try hStack.view(TextMessageView.self, 1)
        
        XCTAssertEqual(try image.actualImage().name(), "person.circle.fill")
        XCTAssertEqual(try textMessageView.find(ViewType.Text.self).string(), messageModel.content)
    }
    
    func test_groupMessageView_forOtherUser() throws {
        let messageModel = MessageModel(content: "Hello, World!", isCurrentUser: false, createdDate: Date())
        let viewModel = GroupMessageViewModel(message: messageModel)
        let view = GroupMessageView(viewModel: viewModel)
        
        let hStack = try view.inspect().hStack()
        let spacer = try hStack.spacer(0)
        let textMessageView = try hStack.view(TextMessageView.self, 1)
        
        XCTAssertNoThrow(spacer)
        XCTAssertEqual(try textMessageView.find(ViewType.Text.self).string(), messageModel.content)
    }
}
