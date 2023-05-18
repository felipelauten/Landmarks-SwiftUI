//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by Felipe Christian Lautenschlager on 18/05/2023.
//

import SwiftUI

struct LandmarkCommands: Commands {
    @FocusedValue(\.selectedLandmark) var selectedLandmark

    var body: some Commands {
        SidebarCommands()

        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite.wrappedValue == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.wrappedValue.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
