//
//  LumenApp.swift
//  Lumen
//
//  Created by Aram Soneson on 3/8/25.
//

import SwiftUI

@main
struct LumenApp: App {
    // Defines the variable to open windows
    @Environment(\.openWindow) private var openWindow
    // Defines the variable for the menu bar item's icon
    @AppStorage("menuBarIcon") private var menuBarIcon: String = "circle.fill"
    // Defines the variable for whether the Welcome window opens
    @AppStorage("shouldWelcome") var shouldWelcome: Bool = true

    var body: some Scene {
        // Defines the menu bar item
        MenuBarExtra {
            // Defines the button that links to the About window
            Button("About") {
                openWindow(id: "about")
            }
            
            // Defines the button that links to the Settings window
            SettingsLink {
                Label("Settings", systemImage: "gearshape")
            }
            // Adds the keyboard shortcut tooltip
            .keyboardShortcut(",", modifiers: .command)
            
            Divider()
            
            // Defines the button that quits the app
            Button("Quit") {
                NSApp.terminate(nil)
            }
            // Adds the keyboard shortcut tooltip
            .keyboardShortcut("Q", modifiers: .command)
        }
        // Defines the menu bar item's content that is displayed in the menu bar itself
        label: {
            HStack {
                Image(systemName: menuBarIcon)
            }
        }
        
        // Defines the About window
        Window("About", id: "about") {
            AboutView()
                // Removes the window toolbar's title text and background
                .toolbar(removing: .title)
                .toolbarBackground(.hidden, for: .windowToolbar)
                
                // Disables the window controls to minimize and maximize the window (yellow and green traffic lights)
                .windowMinimizeBehavior(.disabled)
                .windowFullScreenBehavior(.disabled)
                .windowResizeBehavior(.disabled)
                
                // Sets the window's width and height
                .frame(maxWidth: 250, maxHeight: 300)
        }
        // Sets the window to sit on top of all other windows
        .windowLevel(.floating)
        // Sets the window to resize around the content
        .windowResizability(.contentSize)
        
        // Defines the Welcome window
        Window("Welcome", id: "welcome") {
            WelcomeView()
                // Removes the window toolbar's title text and background
                .toolbar(removing: .title)
                .toolbarBackground(.hidden, for: .windowToolbar)
            
                // Disables the window controls to close, minimize, and maximize the window (traffic lights)
                .windowDismissBehavior(.disabled)
                .windowMinimizeBehavior(.disabled)
                .windowFullScreenBehavior(.disabled)
                .windowResizeBehavior(.disabled)
            
                // Sets the window's width and height
                .frame(maxWidth: 420, maxHeight: 480)
        }
        // Sets the window to sit on top of all other windows
        .windowLevel(.floating)
        //Sets the window to open on launch if shouldLaunchWelcome = true
        .defaultLaunchBehavior(shouldWelcome ? .presented : .automatic)
        // Sets the window to resize around the content
        .windowResizability(.contentSize)
        
        // Defines the Settings window
        Settings {
            SettingsView()
                // Removes the window toolbar's background
                .toolbarBackground(.hidden, for: .windowToolbar)
            
                // Sets the window's width and height
                .frame(maxWidth: 350, maxHeight: 115)
        }
        // Sets the window to sit on top of all other windows
        .windowLevel(.floating)    }
}
