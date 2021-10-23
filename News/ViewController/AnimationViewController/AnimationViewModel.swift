//
//  AnimationViewModel.swift
//  News
//
//  Created by Muhammed Shabeer on 23/10/21.
//

import Foundation

enum TapGestureRecognizerName: String {
    case squareView
    case contentView
}

enum SquareViewState {
    case initial
    case centre
    case fullScreen
    
    mutating func next() {
        switch self {
        case .initial:
            self = .centre
        
        case .centre:
            self = .fullScreen
        
        case .fullScreen:
            self = .initial
        }
    }
}

class AnimationViewModel {
    var squareViewState = SquareViewState.initial
}
