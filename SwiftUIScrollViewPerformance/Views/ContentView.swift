//
//  ContentView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

struct ContentView: View {
	@Environment(Settings.self) var settings
	
    var body: some View {
		content()
			.toolbar {
				ToolbarView(settings: settings)
					.padding()
			}
    }
	
	@ViewBuilder
	private func content() -> some View {
		if settings.useNavigationSplitView {
			NavigationSplitView {
				List {
					Text("Lorem")
					Text("Ipsum")
				}
				.listStyle(.sidebar)

			} detail: {
				EditMixView()
			}
		} else {
			EditMixView()
		}

	}
}

#Preview {
	ContentView()
}

