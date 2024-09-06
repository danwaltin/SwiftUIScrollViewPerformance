//
//  ToolbarView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

struct ToolbarView: View {
	@Bindable var settings: Settings
	
	var body: some View {
		Toggle(isOn: $settings.useNavigationSplitView) {
			Text("Use NavigationSplitView")
		}.toggleStyle(.switch)

		Toggle(isOn: $settings.enableMacOS15OnScrollVisibilityChanged) {
			Text("Enable macOS 15 OnScrollVisibilityChanged")
		}.toggleStyle(.switch)
	}
}
