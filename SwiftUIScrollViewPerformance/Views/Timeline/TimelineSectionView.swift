//
//  TimelineSectionView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import SwiftUI

struct TimelineSectionView: View {
	let section: TimelineSection
	
	var body: some View {
		content()
			.frame(width: section.displayWidth)
	}
	
	@ViewBuilder
	private func content() -> some View {
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
}
