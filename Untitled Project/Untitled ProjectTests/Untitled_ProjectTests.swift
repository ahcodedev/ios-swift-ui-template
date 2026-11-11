// Untitled_ProjectTests.swift
// Untitled Project
//
// Created by Aaron on 11/10/26.
// Copyright © 2026. All rights reserved.
//

import Testing

@testable import Untitled_Project

struct Untitled_ProjectTests {

    @MainActor
    @Test func example() async throws {
        let view = ContentView()
        let msg = view.helloWorld()
        #expect(msg == "Hello, world!")
    }

}
