// Untitled_ProjectUITests.swift
// Untitled Project
//
// Created by Aaron on 11/10/26.
// Copyright © 2026. All rights reserved.
//

import XCTest

final class Untitled_ProjectUITests: UITestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.exists)
    }
}
