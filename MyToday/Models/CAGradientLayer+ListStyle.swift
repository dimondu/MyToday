//
//  CAGradientLayer+ListStyle.swift
//  MyToday
//
//  Created by Дмитрий Дуров on 07.12.2022.
//

import UIKit

extension CAGradientLayer {
    
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .all:
            beginColor = UIColor(named: "TodatGradientAllBegin") ?? .green
            endColor = UIColor(named: "TodayGradientAllEnd") ?? .green
        case .future:
            beginColor = UIColor(named: "TodayGradientFutureBegin") ?? .green
            endColor = UIColor(named: "TodayGradientFutureEnd") ?? .green
        case .today:
            beginColor = UIColor(named: "TodayGradientTodayBegin") ?? .green
            endColor = UIColor(named: "TodayGradientTodayEnd") ?? .green
        }
        return [beginColor.cgColor, endColor.cgColor]
    }
}
