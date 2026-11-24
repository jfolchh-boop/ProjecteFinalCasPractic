//
//  APIState.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 24/11/26.
//

import Foundation

enum APIState: Equatable{
    case idle
    case loading
    case loaded([Track])
    case error(String)
}
