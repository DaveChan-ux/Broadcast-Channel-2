//
//  Home.swift
//  Broadcast Channel 2
//
//  Created by Dave.Chan on 3/19/25.
//


import SwiftUI

struct Home: View {
    /// View Properties
    @State private var activeTab: Tab = .home
    /// All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    /// Bounce Property
    @State private var bouncesUp: Bool = true
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                /// YOUR TAB VIEWS
                NavigationStack {
                    VStack {

                    }
                    .navigationTitle(Tab.home.title)
                }
                .setUpTab(.home)

                NavigationStack {
                    VStack {

                    }
                    .navigationTitle(Tab.discover.title)
                }
                .setUpTab(.discover)

                NavigationStack {
                    VStack {

                    }
                    .navigationTitle(Tab.watch.title)
                }
                .setUpTab(.watch)

                NavigationStack {
                    VStack {

                    }
                    .navigationTitle(Tab.activity.title)
                }
                .setUpTab(.activity)

                NavigationStack {
                    VStack {

                    }
                    .navigationTitle(Tab.profile.title)
                }
                .setUpTab(.profile)
            }

//            /// To toggle between bounce up and down animation
//            Picker("", selection: $bouncesDown) {
//                Text("Bounces Down")
//                    .tag(true)
//
//                Text("Bounces Up")
//                    .tag(false)
//            }
//            .pickerStyle(.segmented)
//            .padding(.horizontal, 15)
//            .padding(.bottom, 20)

            CustomTabBar()
        }
    }

    /// Custom tab bar
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab

                VStack(spacing: 4) {
                    tab.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24) // Ensure size is consistent
                    .symbolEffect(bouncesUp ? .bounce.down.byLayer : .bounce.up.byLayer, options: .speed(3).repeat(1), value: animatedTab.isAnimating)


                    Text(tab.title)
                        .font(.body)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                .sensoryFeedback(.impact, trigger: activeTab)
                /// You Can Also Use Button, If you Choose to
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion: {
                        var trasnaction = Transaction()
                        trasnaction.disablesAnimations = true
                        withTransaction(trasnaction) {
                            animatedTab.isAnimating = nil
                        }
                    })
                }
            }
        }
        .background(.bar)
    }
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
