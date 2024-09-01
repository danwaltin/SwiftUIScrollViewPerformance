//
//  SectionTime.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import SwiftUI

struct SectionTime: View {
	let time: TimeInterval?

	var body: some View {
		if let time {
			Text(time.asDurationString())
				.font(.footnote)
		}
	}
}
