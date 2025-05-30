//
//  ITTTSettingsView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 27/05/25.
//

import SwiftUI

struct ITTTParentSettingsView: View {
    // MARK: - State Properties

    @EnvironmentObject private var navigationState: ITTTNavigationState
    @State private var isSoundEnabled = true
    @State private var showResetConfirmation = false
    
    var body: some View {
        ZStack {
            ITTTLinearGradientView()
            
            List {
                // Game Settings Section
                Section(header: Text("Game Settings").foregroundColor(.white)) {
                    Toggle("Sound Effects", isOn: $isSoundEnabled)
                        .tint(.blue)
                }
                
                // Player Settings Section
                Section(header: Text("Player Settings").foregroundColor(.white)) {
                    Button("Edit Player Profile") {
                        navigateToProfile()
                    }
                    
                    NavigationLink("Customize Game Pieces") {
                        Text("Customization View") // Placeholder for customization view
                    }
                }
                
                // Game Statistics Section
                Section(header: Text("Game Statistics").foregroundColor(.white)) {
                    NavigationLink("View Achievement") {
                        Text("Achievement View") // Placeholder for achievements
                    }
                }
                
                // Data Management Section
                Section(header: Text("Data Management").foregroundColor(.white)) {
                    Button(action: {
                        showResetConfirmation = true
                    }) {
                        HStack {
                            Text("Reset Game Data")
                                .foregroundColor(.red)
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                // About Section
                Section(header: Text("About").foregroundColor(.white)) {
                    NavigationLink("Privacy Policy") {
                        Text("Privacy Policy View") // Placeholder for privacy policy
                    }
                    
                    NavigationLink("Terms of Service") {
                        Text("Terms View") // Placeholder for terms
                    }
                    
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(GroupedListStyle())
        }
        .navigationTitle("Settings")
        .alert("Reset Game Data", isPresented: $showResetConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Reset", role: .destructive) {
                resetGameData()
            }
        } message: {
            Text("This will permanently delete all game progress and scores. This action cannot be undone.")
        }
    }
    
    // MARK: - Private Methods
    
    private func resetGameData() {
        // Implement reset logic here
    }
    
    private func navigateToProfile() {
        navigationState.navigationPath.append(NavigationDestination.profile)
    }
}
