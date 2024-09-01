//
//  SwiftUIScrollViewPerformanceApp.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

@main
struct SwiftUIScrollViewPerformanceApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(mix: mix)
        }
    }
}

let tracks: [Track] = [
	.init(id: 0, title: "Dancing Queen",                  length: 4.min),
	.init(id: 1, title: "Bjekkergauken",                  length: 4.5.min),
	.init(id: 2, title: "Animals",                        length: 5.min),
	.init(id: 3, title: "Always Look On the Bright Side", length: 3.5.min),
	.init(id: 4, title: "Längtan till landet",            length: 3.min),
	.init(id: 5, title: "Söndermarken",                   length: 4.min),
	.init(id: 6, title: "Happyland",                      length: 4.5.min),
	.init(id: 7, title: "How Much Is the Fish",           length: 5.min),
	.init(id: 8, title: "Boom Boom Ba",                   length: 3.min)
]

let mix = Mix(id: 100, tracks: tracks)
