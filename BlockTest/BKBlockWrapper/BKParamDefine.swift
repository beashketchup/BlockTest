//
//  BKParamDefine.swift
//  BKGBServer
//
//  Created by Ananya on 3/8/17.
//  Copyright © 2017 Ananya. All rights reserved.
//

public enum BKServiceURL : String {
    
    case b2bSDK = "https://sandbox.api.visa.com"
}

public enum BKServiceFunction : String {
    
    case helloService = "/vdp/helloworld",
    bankService = "/visab2bconnect/v1/banks",
    companyService = "/visab2bconnect/v1/companies",
    supplierService = "/visab2bconnect/v1/suppliers",
    paymentService = "/visab2bconnect/v1/payments",
    invoiceService = "/visab2bconnect/v1/payments/bankId/{bankId}/searchType/{searchType}/keyword/O"
}

public let visaUser = "##VISA_USERNAME##"
public let visaPass = "##VISA_PASS##"

public enum BKCert : String {
    
    case b2bCert = "##CERT##.p12"
}

public let p12CertificateMap : [String : String] = ["##CERT##.p12" : "##CERT_PASSWORD##"]
