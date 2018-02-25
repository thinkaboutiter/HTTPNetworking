//
//  AbstractAlamofireBasedWebService.swift
//  HTTPNetworking
//
//  Created by Boyan Yankov on W08 25/Feb/2018 Sun.
//

import Foundation
import Alamofire

open class AbstractAlamofireBasedWebService: AlamofireWebServicable {
    
    // MARK: - Properties
    open var alamofireRequest: Alamofire.Request?
    
    // MARK: - Initialization
    public init() {
        
    }
    
    deinit {
        
    }
    
    // MARK: - AlamofireWebServicable protocol
    /// httpVerb method
    open func httpVerb() -> Alamofire.HTTPMethod {
        return HTTPMethod.get
    }
    
    /// Request parameters encoding
    open func requestParametersEncoding() -> Alamofire.ParameterEncoding {
        return URLEncoding.default
    }
    
    // MARK: - WebServicable protocol
    // MARK: Request
    /// Base endpoint for all services
    open class func baseEndpoint() -> String {
        assert(false, "subclasses should override")
        return String()
    }
    
    /// Endpoint for particular web service
    open func instanceEndpoint() -> String {
        assert(false, "subclasses should override")
        return String()
    }
    
    /// Service endpoint complete URL
    open func serviceEndpoint() -> String {
        let baseEndpoint = type(of: self).baseEndpoint()
        let instanceEndpoint = self.instanceEndpoint()
        
        return "\(baseEndpoint)\(instanceEndpoint)"
    }
    
    /// Add parameters to the request.
    open func requestParameters() -> [String : Any]? {
        assert(false, "subclasses should override")
        return nil
    }
    
    /// Request headers
    open func requestHeaders() -> [String : String]? {
        assert(false, "subclasses should override")
        return nil
    }
    
    /// Configure request object before it is called
    open func configureRequest(_ request: NSMutableURLRequest) {
        // Subclasses to implement if required
    }
    
    // MARK: Response
    /// The JSON serialization reading options
    open func responseJSONReadingOptions() -> JSONSerialization.ReadingOptions {
        return JSONSerialization.ReadingOptions.mutableContainers
    }
    
    /// create/change/update response object to map to the web service response keys
    open func responseObjectFromServiceResponse(_ response: Any) -> Any {
        return response
    }
    
    // MARK: - Life cycle
    open func addTaskObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(startNetworkActivityIndicator), name: Notification.Name.Task.DidResume, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stopNetworkActivityIndicator), name: Notification.Name.Task.DidSuspend, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stopNetworkActivityIndicator), name: Notification.Name.Task.DidCancel, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stopNetworkActivityIndicator), name: Notification.Name.Task.DidComplete, object: nil)
    }
    
    open func removeTaskObservers() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.Task.DidResume, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.Task.DidSuspend, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.Task.DidCancel, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.Task.DidComplete, object: nil)
    }
    
    // MARK: - Network Activity Indicator
    @objc open func startNetworkActivityIndicator() {
        if !UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    @objc open func stopNetworkActivityIndicator() {
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
