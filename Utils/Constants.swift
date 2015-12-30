//
//  Constants.swift
//  Utils
//
//  Created by Le Tai on 10/16/15.
//  Copyright © 2015 AJ. All rights reserved.
//

public struct Constants {}

public enum MessageCode: Int {
    case Unknown = 0
    case Successfully = 1
    case Fail = 2
    case SystemException = 3
    case InteractiveWithDatabaseFail = 4
    case ElementIsNotFound = 5
    case ElementIsInvalid = 6
    case ElementIsEmpty = 7
    case ElementHasBeenUsed = 8
    case ElementIsInvalidOrUsed = 9
    case ElementExpired = 10
    case ObjectIsNotFound = 11
    case ObjectIsNotBelongToYou = 12
    case RequestHasAccepted = 13
    case RequestHasDenied = 14
    case CertificateVerified = 15
    case UserIsBusy = 17
    case UserAndAngelIsNotSamePlaceAndTime = 18
    case NotificationRequestVerify = 500
    case NotificationVerifyCertificateSuccess = 501
    case NotificationRequestMakeTrip = 502
    case NotificationReplyMakeTripAccept = 503
    case NotificationReplyMakeTripDeny = 504
    case NotificationRequestPhoneNumber = 505
    case NotificationAcceptPhoneNumber = 506
    case NotificationAlertTripComingUp = 507
    case NotificationStartTrip = 508
    case NotificationEndTrip = 509
    
    public var description: String {
        switch self {
        case .Unknown:
            return NSLocalizedString("An unspecified error occurred", comment: "")
        case .Successfully:
            return NSLocalizedString("Successfully", comment: "")
        case .Fail:
            return NSLocalizedString("An unspecified error occurred", comment: "")
        case .SystemException, .InteractiveWithDatabaseFail:
            return NSLocalizedString("Internal Server Error", comment: "")
        case .ElementIsEmpty:
            return NSLocalizedString("There are some fields were empty", comment: "")
        case .ElementExpired:
            return NSLocalizedString("There are some fields were expired", comment: "")
        case .ElementIsInvalid, .ElementIsInvalidOrUsed:
            return NSLocalizedString("There are some field were invalid", comment: "")
        case .ElementIsNotFound:
            return NSLocalizedString("There are some fields were not found", comment: "")
        case .ElementHasBeenUsed:
            return NSLocalizedString("There are some fields have been used", comment: "")
        case .ObjectIsNotFound:
            return NSLocalizedString("Content not found", comment: "")
        case .ObjectIsNotBelongToYou:
            return NSLocalizedString("Content is not belong to you", comment: "")
        case .RequestHasDenied:
            return NSLocalizedString("Request has denied", comment: "")
        case .RequestHasAccepted:
            return NSLocalizedString("Request has accepted", comment: "")
        case .CertificateVerified:
            return NSLocalizedString("Certificate verified", comment: "")
        case .UserIsBusy:
            return NSLocalizedString("User is busy", comment: "")
        case .UserAndAngelIsNotSamePlaceAndTime:
            return NSLocalizedString("User and angel is not same place and time", comment: "")
        case .NotificationRequestVerify:
            return NSLocalizedString("Request verify", comment: "")
        case .NotificationVerifyCertificateSuccess:
            return NSLocalizedString("Verify certificates success", comment: "")
        case .NotificationRequestMakeTrip:
            return NSLocalizedString("Sent request make trip", comment: "")
        case .NotificationReplyMakeTripAccept:
            return NSLocalizedString("Your request make trip was accepted", comment: "")
        case .NotificationReplyMakeTripDeny:
            return NSLocalizedString("Your request make trip was denied", comment: "")
        case .NotificationRequestPhoneNumber:
            return NSLocalizedString("Wanna view your phone number", comment: "")
        case .NotificationAcceptPhoneNumber:
            return NSLocalizedString("Your request view phone number was accepted", comment: "")
        case .NotificationAlertTripComingUp:
            return NSLocalizedString("You have some coming trips", comment: "")
        case .NotificationStartTrip:
            return NSLocalizedString("Your trip begins", comment: "")
        case .NotificationEndTrip:
            return NSLocalizedString("Your trip ended", comment: "")
        }
    }
    
    public func foundationError() -> NSError {
        return NSError(domain: Constants.Error.MessageCodeErrorDomain, code: rawValue, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
    }
}