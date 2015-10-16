//
//  Error.swift
//  Utils
//
//  Created by Le Tai on 10/16/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

enum APIError: Int, ErrorType, CustomStringConvertible {
    case Unspecified
    case Unauthorized = 401
    case Forbidden = 403
    case PageNotFound = 404
    case TimeOut = 408
    case InternalServer = 500
    case Network = 1009
    
    var description: String {
        switch self {
        case .Unspecified:
            return NSLocalizedString("An unspecified error occurred", comment: "")
        case .PageNotFound:
            return NSLocalizedString("Page Not Found", comment: "")
        case .Unauthorized:
            return NSLocalizedString("Authorization Required", comment: "")
        case .Forbidden:
            return NSLocalizedString("Forbidden", comment: "")
        case .TimeOut:
            return NSLocalizedString("Time Out", comment: "")
        case .InternalServer:
            return NSLocalizedString("Internal Server Error", comment: "")
        case .Network:
            return NSLocalizedString("Lost Internet Connection", comment: "")
        }
    }
    
    func foundationError() -> NSError {
        return NSError(domain: Constants.APIError.errorDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

extension Constants {
    struct APIError {
        static let errorDomain = "com.AJ.error"
    }
}
