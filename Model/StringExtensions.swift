//
//  String.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 03/05/2021.
//

import Foundation

extension String
{
    var isAlphaNumeric: Bool
    {
        return !isEmpty && (range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil)
    }
}
