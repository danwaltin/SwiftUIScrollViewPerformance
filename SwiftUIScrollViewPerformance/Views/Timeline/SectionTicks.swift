//
//  SectionTicks.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import SwiftUI

struct SectionTicks: Shape {
	private let majorHeight = 0.6
	private let middleHeight = 0.4
	private let minorHeight = 0.2
	
	let ticks: [TimelineSectionTick]
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		for tick in ticks {
			let x = rect.minX + tick.position
			switch tick.type {
			case .major:
				path.move(to: .init(x: x, y: rect.maxY))
				path.addLine(to: .init(x: x, y: rect.maxY * (1 - majorHeight)))
			case .middle:
				path.move(to: .init(x: x, y: rect.maxY))
				path.addLine(to: .init(x: x, y: rect.maxY * (1 - middleHeight)))
			case .minor:
				path.move(to: .init(x: x, y: rect.maxY))
				path.addLine(to: .init(x: x, y: rect.maxY * (1 - minorHeight)))
			}
		}
		return path
	}
}
