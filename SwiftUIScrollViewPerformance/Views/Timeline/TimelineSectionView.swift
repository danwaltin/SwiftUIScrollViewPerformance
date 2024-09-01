//
//  TimelineSectionView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import SwiftUI

struct TimelineSectionView: View {
	let section: TimelineSection
	
	@State private var isVisible = true

	var body: some View {
		if #available(macOS 15.0, *) {
			content()
				.frame(width: section.displayWidth)
//				.onScrollVisibilityChange(threshold: 0.01) {
//					isVisible = $0
//				}
		} else {
			content()
				.frame(width: section.displayWidth)
		}
	}
	
	@ViewBuilder
	private func content() -> some View {
		if isVisible {
			visibleContent()
		} else {
			invisibleContent()
		}
	}
	
	@ViewBuilder
	private func visibleContent() -> some View {
		SectionTicks(ticks: section.ticks)
			.stroke(.green, lineWidth: 1)
			.overlay(alignment: .topLeading) {
				SectionTime(time: section.displayStartTime)
					.padding(.leading, -1)
			}
			.overlay(alignment: .topTrailing) {
				SectionTime(time: section.displayEndTime)
					.padding(.trailing, -1)
			}
	}
	
	@ViewBuilder
	private func invisibleContent() -> some View {
		Color.clear.allowsHitTesting(false)
	}
}
