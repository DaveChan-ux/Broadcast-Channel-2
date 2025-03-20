//
//  Tab.swift
//  Broadcast Channel 2
//
//  Created by Dave.Chan on 3/19/25.
//

import SwiftUI

/// Tab's
enum Tab: String, CaseIterable {
    case home = "ltkhome"
    case discover = "magnifyingglass"
    case watch = "ltkwatch" // Keep as a string, not an Image
    case activity = "bell"
    case profile = "person"

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .discover:
            return "Discover"
        case .watch:
            return "Watch"
        case .activity:
            return "Activity"
        case .profile:
            return "Profile"
        }
    }

    var image: Image {
        switch self {

        case .home:
            return Image("ltkhome") // Load custom home icon

        case .discover:
            return Image("ltkdiscover") // Load custom home icon

        case .watch:
            return Image("ltkwatch") // Load custom watch icon

        case .activity:
            return Image("ltkactivity") // Load custom watch icon

        case .profile:
            return Image("ltkprofile") // Load custom watch icon

        default:
            return Image(systemName: self.rawValue) // Use SF Symbols for others
        }
    }

}



/// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}


