//
//  BKServerWrapper.swift
//  BlockTest
//
//  Created by Ananya on 9/3/18.
//  Copyright © 2018 Ananya. All rights reserved.
//

import Foundation


public class BKServerWrapper: NSObject {
    
    fileprivate let reachability = Reachability()!
    
    fileprivate var serverPath = ""        
    
    override public init() {
        super.init()
    }
    
    deinit {
        
        print("BKServerWrapper deallocated")
    }
    
    //MARK: Public Methods
    
    public func setBasePath(_ path : String) {
        self.serverPath = path
    }
    
    public func isValidEnvirnoment(_ completion : @escaping ((Bool) -> ())) {
        
        let forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.helloService.rawValue
        let newRequest = self.createServiceRequest(forPath, forType: .get, basicAuth: (visaUser, visaPass))
        self.executeService(newRequest, forRequestBody: nil, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** TEST ENVIRNOMENT FAILED *****")
                completion(false)
                return
            }
            
            print("TEST ENV DATA - \(newData)")
            print("***** TEST ENVIRNOMENT SUCCESS *****")
            completion(true)
        }
    }
    
    public func getBank(_ forId : String, completion : @escaping (([String : Any]) -> ())) {
        
        let forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.bankService.rawValue + "/\(forId)"
        let newRequest = self.createServiceRequest(forPath, forType: .get, basicAuth: (visaUser, visaPass))        
        self.executeService(newRequest, forRequestBody: nil, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** GET BANK FAILED *****")
                completion([:])
                return
            }
            
            print("TEST GET BANK DATA - \(newData)")
            print("***** GET BANK SUCCESS *****")
            completion(newData)
        }
    }
    
    public func addBank(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        let forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.bankService.rawValue
        let newRequest = self.createServiceRequest(forPath, forType: .post, basicAuth: (visaUser, visaPass))
        let requestBody = info["body"] as! String//self.createRequestBody(info)
        self.executeService(newRequest, forRequestBody: requestBody, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** ADD BANK FAILED *****")
                completion(false)
                return
            }
            
            print("TEST BANK DATA - \(newData)")
            print("***** ADD BANK SUCCESS *****")
            completion(true)
        }
    }
    
    public func addCompany(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        let forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.companyService.rawValue
        let newRequest = self.createServiceRequest(forPath, forType: .post, basicAuth: (visaUser, visaPass))
        let requestBody = info["body"] as! String//self.createRequestBody(info)
        self.executeService(newRequest, forRequestBody: requestBody, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** ADD COMPANY FAILED *****")
                completion(false)
                return
            }
            
            print("TEST COMPANY DATA - \(newData)")
            print("***** ADD COMPANY SUCCESS *****")
            completion(true)
        }
    }
    
    public func addSupplier(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        let forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.supplierService.rawValue
        let newRequest = self.createServiceRequest(forPath, forType: .post, basicAuth: (visaUser, visaPass))
        let requestBody = info["body"] as! String//self.createRequestBody(info)
        self.executeService(newRequest, forRequestBody: requestBody, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** ADD SUPPLIER FAILED *****")
                completion(false)
                return
            }
            
            print("TEST SUPPLIER DATA - \(newData)")
            print("***** ADD SUPPLIER SUCCESS *****")
            completion(true)
        }
    }
    
    public func makePayment(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        let forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.paymentService.rawValue
        let newRequest = self.createServiceRequest(forPath, forType: .post, basicAuth: (visaUser, visaPass))
        let requestBody = info["body"] as! String//self.createRequestBody(info)
        self.executeService(newRequest, forRequestBody: requestBody, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** PAYMENT FAILED *****")
                completion(false)
                return
            }
            
            print("TEST PAYMENT DATA - \(newData)")
            print("***** PAYMENT SUCCESS *****")
            completion(true)
        }
    }
    
    public func getInvoice(_ info : [String : Any], completion : @escaping (([String : Any]) -> ())) {
        
        guard let bankId = info["bankId"] as? String else {
            print("***** BANK ID MISSING *****")
            completion([:])
            return
        }
        
        guard let searchType = info["searchType"] as? String else {
            print("***** SEARCH TYPE MISSING *****")
            completion([:])
            return
        }
        
        var forPath = BKServiceURL.b2bSDK.rawValue + BKServiceFunction.invoiceService.rawValue
        forPath = forPath.replacingOccurrences(of: "{bankId}", with: bankId)
        forPath = forPath.replacingOccurrences(of: "{searchType}", with: searchType)
        let newRequest = self.createServiceRequest(forPath, forType: .get, basicAuth: (visaUser, visaPass))
        self.executeService(newRequest, forRequestBody: nil, forP12: BKCert.b2bCert.rawValue) {
            (status : Bool, data : [String : Any]?) in
            
            guard let newData = data else {
                
                print("***** INVOICE FAILED *****")
                completion([:])
                return
            }
            
            print("TEST INVOICE DATA - \(newData)")
            print("***** INVOICE SUCCESS *****")
            completion(newData)
        }
    }
    
    // MARK: Private Methods
    
    fileprivate func createServiceRequest(_ forPath : String, forType : BKRequestType,
                                          basicAuth : (String, String)? = nil) -> BKRequest {
        
        return BKServerManager.sharedManager.createRequest(forType, forPath: forPath,
                                                           content: .json, basicAuth: basicAuth)
    }
    
    fileprivate func createRequestBody(_ requestData : [String : Any]) -> String? {
        
        do {
            let newObject = try JSONSerialization.data(withJSONObject: requestData, options: [])
            if let jsonStr = String.init(data: newObject, encoding: .utf8) {
                return jsonStr
            }
        } catch _ {
            print("Error - Not able to serialize JSON response")
        }
        
        return nil
    }
    
    fileprivate func executeService(_ forRequest : BKRequest, forRequestBody : String?, forP12 : String?,
                                    completion : @escaping ((Bool, [String : Any]?) -> ())) {
        
        let serviceId = BKServerManager.sharedManager.createAndExecService(forRequest, forReqBody: forRequestBody, forP12: forP12) {
            (status : BKServerStatus, result : Any?) in
            
            if let resultData = result as? [String : Any] {
                completion(true, resultData)
            }
            else if let resultData = result as? [[String : Any]] {
                completion(true, ["data" : resultData])
            }
            else {
                completion(false, nil)
            }            
        }
        
        print("Service : \(serviceId)")
    }
}
