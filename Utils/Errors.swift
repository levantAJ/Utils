//
//  Errors.swift
//  PinBike
//
//  Created by Le Tai on 10/16/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import UIKit

public enum FailedMessage: Int, Error, CustomStringConvertible {
    case Failed
    case DeleteTripFailed
    case NoChangeWhenRepeatTrip
    case RepeatTripFailed
    
    public var description: String {
        switch self {
        case .Failed:
            return NSLocalizedString("Failed", comment: "")
        case .DeleteTripFailed:
            return NSLocalizedString("Delete the trip was failed", comment: "")
        case .NoChangeWhenRepeatTrip:
            return NSLocalizedString("Please change the time which you want to repeat the trip", comment: "")
        case .RepeatTripFailed:
            return NSLocalizedString("Could not repeate your trip", comment: "")
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.SuccessMessageDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

public enum SuccessMessage: Int, Error, CustomStringConvertible {
    case Success
    case DeleteTripSuccess
    
    public var description: String {
        switch self {
        case .Success:
            return NSLocalizedString("Successfully", comment: "")
        case .DeleteTripSuccess:
            return NSLocalizedString("The trip has been successfully deleted", comment: "")
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.SuccessMessageDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

public enum LoadingStatus: Int, Error, CustomStringConvertible {
    case Loading
    case UpdateProfile
    case MakeRequest
    case RemoveRequest
    case DeleteTrip
    case FetchingFacebookInfo
    case CreateTrip
    case RetrievePairedTrips
    case Rating
    case LoadingPrice
    case Sharing
    
    public var description: String {
        switch self {
        case .MakeRequest:
            return NSLocalizedString("Making your request…", comment: "")
        case .RemoveRequest:
            return NSLocalizedString("Removing your request…", comment: "")
        case .Loading:
            return NSLocalizedString("Loading…", comment: "")
        case .DeleteTrip:
            return NSLocalizedString("Deleting…", comment: "")
        case .FetchingFacebookInfo:
            return NSLocalizedString("Fetching your Facebook info…", comment: "")
        case .UpdateProfile:
            return NSLocalizedString("Updating your profile…", comment: "")
        case .CreateTrip:
            return NSLocalizedString("We are posting your trip…", comment: "")
        case .RetrievePairedTrips:
            return NSLocalizedString("Retrieving paired trips…", comment: "")
        case .Rating:
            return NSLocalizedString("Rating…", comment: "")
        case .LoadingPrice:
            return NSLocalizedString("Calculating the price of the trip…", comment: "")
        case .Sharing:
            return NSLocalizedString("Sharing…", comment: "")
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.LoadingStatusDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

public enum AlertError: Int, Error, CustomStringConvertible {
    case Location
    case Failure
    case CallFailure
    
    public var description: String {
        switch self {
        case .Location:
            return Constants.Alert.locationFailureMessage
        case .Failure:
            return Constants.Alert.failureMessage
        case .CallFailure:
            return Constants.Alert.callFailureMessage
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.AlertErrorDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

public enum AuthenticationError: Int, Error, CustomStringConvertible {
    case WrongPassword
    case WrongEmail
    case NotFound
    case AccountExists
    
    public var description: String {
        switch self {
        case .NotFound, .WrongEmail:
            return NSLocalizedString("The email you’ve entered doesn’t match any account", comment: "")
        case .WrongPassword:
            return NSLocalizedString("The password you’ve entered is incorrect", comment: "")
        case .AccountExists:
            return NSLocalizedString("Sorry, the email looks like belongs to an existing account", comment: "")
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.AuthenticationErrorDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

public enum APIError: Int, Error, CustomStringConvertible {
    case Unspecified = 7000
    case NoBodyFound = 7001
    case Cached = 7002
    case NoReceivers = 7003
    case ChattingRealtime = 7004
    case ChattingServer = 7005
    case Location = 7006
    
    case Unauthorized = 401
    case Forbidden = 403
    case PageNotFound = 404
    case TimeOut = 408
    case InternalServer = 500
    case Network = -1009
    
    public var description: String {
        switch self {
        case .NoBodyFound:
            return NSLocalizedString("No content found", comment: "")
        case .Unspecified:
            return NSLocalizedString("An unspecified error occurred", comment: "")
        case .Cached:
            return NSLocalizedString("Can not access cache", comment: "")
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
        case .NoReceivers:
            return NSLocalizedString("No Receivers", comment: "")
        case .ChattingServer:
            return NSLocalizedString("Chatting Server Error", comment: "")
        case .ChattingRealtime:
            return NSLocalizedString("Your friend can not receive messages instantly", comment: "")
        case .Location:
            return NSLocalizedString("Could not get address, try again!", comment: "")
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.APIErrorDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}

public extension Constants {
    public struct Error {
        static let APIErrorDomain = "com.PinBike.Error.API"
        static let AlertErrorDomain = "com.PinBike.Error.Alert"
        static let LoadingStatusDomain = "com.PinBike.Error.Loading"
        static let AuthenticationErrorDomain = "com.PinBike.Error.Authentication"
        static let MessageCodeErrorDomain = "com.PinBike.Error.MessageCode"
        static let SuccessMessageDomain = "com.PinBike.Error.SuccessMessage"
        static let FailedMessageDomain = "com.PinBike.Error.FailedMessage"
    }
    
    public struct Alert {
        static let failureMessage = NSLocalizedString("Whoops! There are some problems were occurred, please try again!", comment: "")
        static let locationFailureTitle = "Could not get your location"
        static let locationFailureMessage = "Whoops! Please go to Setting and allow for us to access your loaction!"
        static let callFailureMessage = NSLocalizedString("We could not call your partner, please check your phone and then call again!", comment: "")
    }
}
