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
			VStack(spacing: 0) {
				EditMixView(mix: mix)
				EditMixBottomToolbar(numberOfTracks: mix.tracks.count)
			}
		}
    }
}

#Preview {
	ContentView(mix: mix)
}

