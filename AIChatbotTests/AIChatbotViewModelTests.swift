//
//  AIChatbotViewModelTests.swift
//  AIChatbotTests
//
//  Created by Sohail Khan on 31/05/2024.
//

import XCTest
import Combine
@testable import AIChatbot

final class AIChatbotViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    let question = "Test question"
    var stub: AIChatbotViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        stub = AIChatbotViewModel()
        stub.generativeModel = MockGenerativeModel()
    }
    
    override func tearDownWithError() throws {
        stub = nil
        try super.tearDownWithError()
    }
    
    @MainActor
    func test_submitQuestion_questionShouldBeAdded()  {
        stub.submit(question: question)

        XCTAssertTrue(stub.isGenerating)
        XCTAssertEqual(stub.messageList.count, 1) // Initial question and response
        XCTAssertEqual(stub.messageList[0].content, question)
    }
    
    @MainActor
    func test_submitQuestion_shouldHave2MessagesOnGenerationComplete() {
        let expectation = XCTestExpectation(description: "Message generation")
        stub.$isGenerating.dropFirst().sink { [unowned self] value in
            if !value {
                XCTAssertEqual(stub.messageList.count, 2)
                
                XCTAssertEqual(stub.messageList[0].content, question)
                XCTAssertTrue(stub.messageList[0].isCurrentUser)
    
                XCTAssertFalse(stub.messageList[1].isCurrentUser)
                expectation.fulfill()
            }
        }
        .store(in: &cancellables)
        stub.submit(question: question)
        wait(for: [expectation], timeout: 0.01)
    }
    
    @MainActor
    func test_submitQuestionThrowError_shouldHaveOneMessage() {
        let expectation = XCTestExpectation(description: "Message generation")
        var stub = AIChatbotViewModel()

        stub.generativeModel = MockGenerativeModel(shouldThrowError: true)

        stub.$isGenerating.dropFirst().sink { value in
            if !value {
                XCTAssertEqual(stub.messageList.count, 1)
                XCTAssertEqual(stub.messageList[0].content, "Test question")
                XCTAssertTrue(stub.messageList[0].isCurrentUser)
                expectation.fulfill()
            }
        }
        .store(in: &cancellables)
        stub.submit(question: question)
        wait(for: [expectation], timeout: 0.01)
    }
}
