//
//  TrackDisplayModel.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

struct TrackDisplayModel : Identifiable {
	let id: Int
	let title: String
	let displayPosition: Double
	let displayWidth: Double
}

extension Array where Element == TrackDisplayModel {
	func zoomedTo(zoom: Double) -> [TrackDisplayModel] {
		self.map{ .init(
			id: $0.id,
			title: $0.title,
			displayPosition: $0.displayPosition * zoom,
			displayWidth: $0.displayWidth * zoom)}
	}
}
