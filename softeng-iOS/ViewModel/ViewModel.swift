//
//  ViewModel.swift
//  softeng-iOS
//
//  Created by Alex Siracusa on 4/1/24.
//

import Foundation
import SwiftUI

enum DisplayState {
    case MAP
    case SEARCH
}

enum SetPath {
    case END
    case START
}

class ViewModel: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    @Published var floorViews: [FloorData]
    @Published var selectedFloor: FloorData
    @Published var displayState: DisplayState = .MAP
    
    @Published var searchFullscreen = false {
        didSet {
            presentNodeSheet = sheet && !searchFullscreen
        }
    }
    @Published var sheet: Bool = false {
        didSet {
            presentNodeSheet = sheet && !searchFullscreen
        }
    }
    
    @Published var presentNodeSheet: Bool = false
    @Published var sheetHeight: PresentationDetent = SHEET_LOW
    @Published var pickDirectionsView: Bool = false
    
    init() {
        let floor3 = FloorData(floor: .F3, image_name: "03_thethirdfloor")
        let floor2 = FloorData(floor: .F2, image_name: "02_thesecondfloor")
        let floor1 = FloorData(floor: .F1, image_name: "01_thefirstfloor")
        let lower1 = FloorData(floor: .L1, image_name: "00_thelowerlevel1")
        let lower2 = FloorData(floor: .L2, image_name: "00_thelowerlevel2")
        
        self.floorViews = [lower2, lower1, floor1, floor2, floor3]
        self.selectedFloor = floor1
    }
    
    func setFloor(floor: Floor) {
        selectedFloor = floorViews.first(where: {$0.floor == floor}) ?? selectedFloor
    }
}
