//
//  CardGameDelegate.swift
//  CardGame
//
//  Created by Gun Makinabakan on 17.10.2022.
//

import Foundation

protocol CardGameDelegate: AnyObject {
    func getReadyForShuffle()
    func resetUI()
}
