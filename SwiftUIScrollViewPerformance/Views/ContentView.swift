//
//  ContentView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

struct ContentView: View {
	@Bindable var settings: Settings
	
    var body: some View {
		content()
			.toolbar {
				Toggle(isOn: $settings.useNavigationSplitView) {
					Text("Use NavigationSplitView")
				}
				.toggleStyle(.checkbox)
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
