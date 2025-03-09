//
//  SettingsView.swift
//  Lumen
//
//  Created by Aram Soneson on 3/8/25.
//

import SwiftUI
import LaunchAtLogin

struct SettingsView: View {
    
    var body: some View {
        // Creates the tab layout
        TabView {
            // Creates the General tab
            Tab("General", systemImage: "gearshape") {
                // Links to the dedicated General view
                GeneralView()
            }
            // Creates the Advanced tab
            Tab("Advanced", systemImage: "wrench.and.screwdriver") {
                // Links to the dedicated Advanced view
                AdvancedView()
            }
        }
    }
}

// Defines the General settings view
struct GeneralView: View {
    // Defines the variable for the menu bar item's icon
    @AppStorage("menuBarIcon") private var menuBarIcon = "circle"
    
    var body: some View {
        // Creates the visual structure of the settings options
        Form {
            // Creates a group of settings options
            Section {
                // Creates a toggle for whether the app opens when logging in
                LaunchAtLogin.Toggle("Launch at login")
                // Creates a dropdown menu with selectable items for the menu bar item's icons
                Picker("Menu bar icon", selection: $menuBarIcon) {
                    // Defines the available icons
                    // systemName defines how the option is shown in the window
                    // .tag defines what the variable will be set to
                    Text("    ")
                        .tag("    ")
                    Image(systemName: "circle")
                        .tag("circle")
                    Image(systemName: "circle.fill")
                        .tag("circle.fill")
                    
                    Image(systemName: "app")
                        .tag("app")
                    Image(systemName: "app.fill")
                        .tag("app.fill")
               
                    Image(systemName: "display")
                        .tag("display")
                    Image(systemName: "laptopcomputer")
                        .tag("laptopcomputer")
                    
                    Image(systemName: "square.2.layers.3d")
                        .tag("square.2.layers.3d")
                    Image(systemName: "square.2.layers.3d.top.filled")
                        .tag("square.2.layers.3d.top.filled")
                }
            }
        }
        // Adds a background to the menu items to group them together
        .formStyle(.grouped)
    }
}

// Defines the Advanced settings view
struct AdvancedView: View {
    var body: some View {
        // Creates the visual structure of the settings options
        Form {
            // Creates a group of settings options
            Section {
                
            }
        }
        // Adds a background to the menu items to group them together
        .formStyle(.grouped)
    }
}

#Preview {
    SettingsView()
        // Sets the window's width and height
        .frame(width: 350, height: 115)
}
