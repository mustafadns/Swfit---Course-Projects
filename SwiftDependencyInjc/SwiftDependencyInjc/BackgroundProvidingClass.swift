//
//  BackgroundProvidingClass.swift
//  SwiftDependencyInjc
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

import Foundation
import UIKit

class BackgroundProvidingClass : BackgroundProviderProtocol {
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemRed, .systemOrange, .systemGreen, .systemPink, .systemMint]
        return backgroundColors.randomElement()!
    }
}
