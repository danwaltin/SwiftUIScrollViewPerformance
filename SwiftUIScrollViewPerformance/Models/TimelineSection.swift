//
//  TimelineSection.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import Foundation

extension TimeInterval {
	func timelineSections(resolution: TimelineResolution) -> [TimelineSection] {
		var sections = [TimelineSection]()
		var totalTime: TimeInterval = 0
		
		let numberOfSections = Int(self / resolution.duration) + (self.truncatingRemainder(dividingBy: resolution.duration) > 0 ? 1 : 0)
		
		for sectionId in 0..<numberOfSections {
			
			let isLastSection = sectionId == (numberOfSections - 1)
			let currentSectionDuration = Swift.min(resolution.duration, self - totalTime)
			sections.append(.init(
				id: sectionId,
				ticks: resolution.ticks(sectionDuration: currentSectionDuration, isLastSection: isLastSection),
				displayStartTime: totalTime,
				displayEndTime: isLastSection ? self : nil,
				displayWidth: currentSectionDuration))
			totalTime += resolution.duration
		}
		
		return sections
	}
}

struct TimelineSection: Identifiable, Equatable {
	let id: Int
	let ticks: [TimelineSectionTick]

	let displayStartTime: TimeInterval
	let displayEndTime: TimeInterval?

	let displayWidth: Double
}

enum TimelineTickType {
	case major
	case middle
	case minor
}

struct TimelineSectionTick: Equatable {
	let type: TimelineTickType
	
	/// Position within the section, a zoomed time
	let position: Double
}

extension TimelineSectionTick {
	static func major(at position: Double) -> TimelineSectionTick {
		.init(type: .major, position: position)
	}
	
	static func middle(at position: Double) -> TimelineSectionTick {
		.init(type: .middle, position: position)
	}
	
	static func minor(at position: Double) -> TimelineSectionTick {
		.init(type: .minor, position: position)
	}
}

enum TimelineResolution {
	case tenSeconds
	case thirtySeconds
	case oneMinute
	case fiveMinutes
	case tenMinutes
	
	var duration: TimeInterval {
		switch self {
		case .tenSeconds:    return 10.sec
		case .thirtySeconds: return 30.sec
		case .oneMinute:     return 1.min
		case .fiveMinutes:   return 5.min
		case .tenMinutes:    return 10.min
		}
	}
	
	func ticks(sectionDuration: TimeInterval, isLastSection: Bool) -> [TimelineSectionTick] {
		var ticks = fullSectionTicks.filter {$0.position < sectionDuration}
		if isLastSection {
			ticks.append(.major(at: sectionDuration))
		}
		
		return ticks
	}
	
	private var fullSectionTicks: [TimelineSectionTick] {
		switch self {
		case .tenSeconds: [
			.major(at: 0),
			.minor(at: 1.sec),
			.minor(at: 2.sec),
			.minor(at: 3.sec),
			.minor(at: 4.sec),
			.middle(at: 5.sec),
			.minor(at: 6.sec),
			.minor(at: 7.sec),
			.minor(at: 8.sec),
			.minor(at: 9.sec)
		]
		case .thirtySeconds: [
			.major(at: 0),
			.minor(at: 5.sec),
			.middle(at: 10.sec),
			.minor(at: 15.sec),
			.middle(at: 20.sec),
			.minor(at: 25.sec)
		]
		case .oneMinute: [
			.major(at: 0),
			.minor(at: 10.sec),
			.minor(at: 20.sec),
			.middle(at: 30.sec),
			.minor(at: 40.sec),
			.minor(at: 50.sec)
		]
		case .fiveMinutes: [
			.major(at: 0),
			.minor(at: 1.min),
			.minor(at: 2.min),
			.minor(at: 3.min),
			.minor(at: 4.min)
		]
		case .tenMinutes: [
			.major(at: 0),
			.minor(at: 1.min),
			.minor(at: 2.min),
			.minor(at: 3.min),
			.minor(at: 4.min),
			.middle(at: 5.min),
			.minor(at: 6.min),
			.minor(at: 7.min),
			.minor(at: 8.min),
			.minor(at: 9.min),
		]
		}
	}
}

extension Array where Element == TimelineSection {
	func zoomedTo(zoom: Double) -> [TimelineSection] {
		self.map {$0.zoomedTo(zoom: zoom)}
	}
}

extension TimelineSection {
	func zoomedTo(zoom: Double) -> TimelineSection {
		.init(
			id: id,
			ticks: ticks.map {$0.zoomedTo(zoom: zoom)},
			displayStartTime: displayStartTime,
			displayEndTime: displayEndTime,
			displayWidth: displayWidth * zoom)
	}
}

extension TimelineSectionTick {
	func zoomedTo(zoom: Double) -> TimelineSectionTick {
		.init(
			type: type,
			position: position * zoom)
	}
}
