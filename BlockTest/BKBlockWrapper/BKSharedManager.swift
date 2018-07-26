//
//  BKSharedManager.swift
//  BlockTest
//
//  Created by Ananya on 9/3/18.
//  Copyright © 2018 Ananya. All rights reserved.
//

import Foundation
import UIKit

public class BKSharedManager : NSObject  {
    
    static let sharedManager = BKSharedManager()
    
    // global variables
    let serverWrapper = BKServerWrapper()
    
    // MARK: init methods
    private override init() {}   //This prevents others from using the default '()' initializer for this class.
    
    // MARK: Public methods
    
    public func testServerEnvirnoment(_ completion : @escaping ((Bool) -> ())) {
        
        self.serverWrapper.isValidEnvirnoment(completion)
    }
    
    public func getBankFor(_ id : String, completion : @escaping (([String : Any]) -> ())) {
        
        self.serverWrapper.getBank(id, completion: completion)
    }
    
    public func addBankFor(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        self.serverWrapper.addBank(info, completion: completion)
    }
    
    public func addCompanyFor(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        self.serverWrapper.addCompany(info, completion: completion)
    }
    
    public func addSupplierFor(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        self.serverWrapper.addSupplier(info, completion: completion)
    }
    
    public func makePaymentFor(_ info : [String : Any], completion : @escaping ((Bool) -> ())) {
        
        self.serverWrapper.makePayment(info, completion: completion)
    }
    
    public func getInvoiceFor(_ info : [String : Any], completion : @escaping (([String : Any]) -> ())) {
        
        self.serverWrapper.getInvoice(info, completion: completion)
    }
}
