//
//  ContentView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

struct ContentView: View {
	let mix: Mix
	
    var body: some View {
		NavigationSplitView {
			List {
				Text("Lorem")
				Text("Ipsum")
			}
			.listStyle(.sidebar)

		} detail: {
			MixView(mix: mix)
		}
    }
}

#Preview {
	ContentView(mix: mix)
}

