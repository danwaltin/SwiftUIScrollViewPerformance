//
//  TimelineSectionsView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import SwiftUI

struct TimelineSectionsView: View {
	let sections: [TimelineSection]
	
	var body: some View {
		HStack(spacing: 0) {
			ForEach(sections) {
				TimelineSectionView(section: $0)
			}
		}
	}
}
