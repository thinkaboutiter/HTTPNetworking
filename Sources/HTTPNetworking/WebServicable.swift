//
//  WebServicable.swift
//  HTTPNetworking
//
//  Created by Boyan Yankov on W08 25/Feb/2018 Sun.
//

import Foundation

public protocol WebServicable {
    
    // MARK: - Configuring the request
    
    /** Base endpoint for all services */
    static func baseEndpoint() -> String
    
    /** Endpoint for particular web service */
    func instanceEndpoint() -> String
    
    /** Service endpoint complete URL */
    func serviceEndpoint() -> String
    
    /** Add parameters to the request. */
    func requestParameters() -> [String : Any]?
    
    /** Request headers */
    func requestHeaders() -> [String : String]?
    
    /** Configure request object before it is called */
    func configureRequest(_ request: NSMutableURLRequest) -> Void
    
    // MARK: - Creating the response object
    
    /** The JSON serialization reading options */
    func responseJSONReadingOptions() -> JSONSerialization.ReadingOptions
    
    /** create/change/update response object to map to the web service response keys */
    func responseObjectFromServiceResponse(_ response: Any) -> Any
}
