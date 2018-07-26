//
//  CreateViewController.swift
//  BlockTest
//
//  Created by Ananya on 21/3/18.
//  Copyright © 2018 Ananya. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    var changeDict : [String : Any] = [:]
    var scrollView = UIScrollView()
    var loadingView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red: 63/255, green: 81/255, blue: 181/255, alpha: 1.0)        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        createLoader()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        scrollView.removeFromSuperview()
        loadingView.removeFromSuperview()
    }
    
    // MARK: Public methods
    public func initViewFor(_ type : Int) {
        
        var yPadding : CGFloat = 0
        let screenSize = UIScreen.main.bounds.size
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 84, width: screenSize.width, height: screenSize.height - 84))
        self.view.addSubview(scrollView)
        
        if type == 1 {
            let lbl1 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl1.font = UIFont.systemFont(ofSize: 15)
            lbl1.text = "Bank Id"
            scrollView.addSubview(lbl1)
            
            let txt1 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt1.borderStyle = .roundedRect
            txt1.tag = 1001
            txt1.delegate = self
            scrollView.addSubview(txt1)
            
            yPadding += 40
            
            let lbl2 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl2.font = UIFont.systemFont(ofSize: 15)
            lbl2.text = "Bank Name"
            scrollView.addSubview(lbl2)
            
            let txt2 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt2.borderStyle = .roundedRect
            txt2.tag = 1002
            txt2.delegate = self
            scrollView.addSubview(txt2)
            
            yPadding += 40
            
            let bankBtn = UIButton(type: .custom)
            bankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
            bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
            bankBtn.setTitle("Add Bank", for: .normal)
            bankBtn.addTarget(self, action: #selector(addBankAction(_:)), for: .touchUpInside)
            bankBtn.center.x = self.view.bounds.width / 2
            scrollView.addSubview(bankBtn)
            
            yPadding += 50
        }
        else if type == 2 {
            let lbl1 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl1.font = UIFont.systemFont(ofSize: 15)
            lbl1.text = "Bank Id"
            scrollView.addSubview(lbl1)
            
            let txt1 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt1.borderStyle = .roundedRect
            txt1.tag = 1001
            txt1.delegate = self
            scrollView.addSubview(txt1)
            
            yPadding += 40
            
            let bankBtn = UIButton(type: .custom)
            bankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
            bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
            bankBtn.setTitle("Get Bank", for: .normal)
            bankBtn.addTarget(self, action: #selector(getBankAction(_:)), for: .touchUpInside)
            bankBtn.center.x = self.view.bounds.width / 2
            scrollView.addSubview(bankBtn)
            
            yPadding += 50
        }
        else if type == 3 {
            let lbl1 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl1.font = UIFont.systemFont(ofSize: 15)
            lbl1.text = "Company Id"
            scrollView.addSubview(lbl1)
            
            let txt1 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt1.borderStyle = .roundedRect
            txt1.tag = 1001
            txt1.delegate = self
            scrollView.addSubview(txt1)
            
            yPadding += 40
            
            let lbl2 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl2.font = UIFont.systemFont(ofSize: 15)
            lbl2.text = "Bank Id"
            scrollView.addSubview(lbl2)
            
            let txt2 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt2.borderStyle = .roundedRect
            txt2.tag = 1002
            txt2.delegate = self
            scrollView.addSubview(txt2)
            
            yPadding += 40
            
            let lbl3 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl3.font = UIFont.systemFont(ofSize: 15)
            lbl3.text = "Enterprise Id"
            scrollView.addSubview(lbl3)
            
            let txt3 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt3.borderStyle = .roundedRect
            txt3.text = "V-USA-EUR-10080373-100000001-001"
            txt3.tag = 1003
            txt3.delegate = self
            scrollView.addSubview(txt3)
            
            yPadding += 40
            
            let bankBtn = UIButton(type: .custom)
            bankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
            bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
            bankBtn.setTitle("Add Company", for: .normal)
            bankBtn.addTarget(self, action: #selector(addCompanyAction(_:)), for: .touchUpInside)
            bankBtn.center.x = self.view.bounds.width / 2
            scrollView.addSubview(bankBtn)
            
            yPadding += 50
        }
        else if type == 4 {
            let lbl1 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl1.font = UIFont.systemFont(ofSize: 15)
            lbl1.text = "Bank Id"
            scrollView.addSubview(lbl1)
            
            let txt1 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt1.borderStyle = .roundedRect
            txt1.tag = 1001
            txt1.delegate = self
            scrollView.addSubview(txt1)
            
            yPadding += 40
            
            let lbl2 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl2.font = UIFont.systemFont(ofSize: 15)
            lbl2.text = "Company Id"
            scrollView.addSubview(lbl2)
            
            let txt2 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt2.borderStyle = .roundedRect
            txt2.tag = 1002
            txt2.delegate = self
            scrollView.addSubview(txt2)
            
            yPadding += 40
            
            let lbl3 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl3.font = UIFont.systemFont(ofSize: 15)
            lbl3.text = "Supplier Id"
            scrollView.addSubview(lbl3)
            
            let txt3 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt3.borderStyle = .roundedRect
            txt3.text = "V-USA-EUR-10080373-100000001-122"
            txt3.tag = 1003
            txt3.delegate = self
            scrollView.addSubview(txt3)
            
            yPadding += 40
            
            let bankBtn = UIButton(type: .custom)
            bankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
            bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
            bankBtn.setTitle("Add Supplier", for: .normal)
            bankBtn.addTarget(self, action: #selector(addSupplierAction(_:)), for: .touchUpInside)
            bankBtn.center.x = self.view.bounds.width / 2
            scrollView.addSubview(bankBtn)
            
            yPadding += 50
        }
        else if type == 5 {
            let lbl1 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl1.font = UIFont.systemFont(ofSize: 15)
            lbl1.text = "Enterprise Id"
            scrollView.addSubview(lbl1)
            
            let txt1 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt1.borderStyle = .roundedRect
            txt1.tag = 1001
            txt1.delegate = self
            scrollView.addSubview(txt1)
            
            yPadding += 40
            
            let lbl2 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl2.font = UIFont.systemFont(ofSize: 15)
            lbl2.text = "Reciever Ent. Id"
            scrollView.addSubview(lbl2)
            
            let txt2 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt2.borderStyle = .roundedRect
            txt2.text = "V-USA-EUR-20990373-100900001-008"
            txt2.tag = 1002
            txt2.delegate = self
            scrollView.addSubview(txt2)
            
            yPadding += 40
            
            let lbl3 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl3.font = UIFont.systemFont(ofSize: 15)
            lbl3.text = "Invoice No."
            scrollView.addSubview(lbl3)
            
            let txt3 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt3.borderStyle = .roundedRect
            txt3.tag = 1003
            txt3.delegate = self
            scrollView.addSubview(txt3)
            
            yPadding += 40
            
            let lbl4 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl4.font = UIFont.systemFont(ofSize: 15)
            lbl4.text = "Amount"
            scrollView.addSubview(lbl4)
            
            let txt4 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt4.borderStyle = .roundedRect
            txt4.tag = 1004
            txt4.delegate = self
            scrollView.addSubview(txt4)
            
            yPadding += 40
            
            let bankBtn = UIButton(type: .custom)
            bankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
            bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
            bankBtn.setTitle("Make Payment", for: .normal)
            bankBtn.addTarget(self, action: #selector(transferAction(_:)), for: .touchUpInside)
            bankBtn.center.x = self.view.bounds.width / 2
            scrollView.addSubview(bankBtn)
            
            yPadding += 50
        }
        else if type == 6 {
            let lbl1 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl1.font = UIFont.systemFont(ofSize: 15)
            lbl1.text = "Bank Id"
            scrollView.addSubview(lbl1)
            
            let txt1 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt1.borderStyle = .roundedRect
            txt1.tag = 1001
            txt1.delegate = self
            scrollView.addSubview(txt1)
            
            yPadding += 40
            
            let lbl2 = UILabel(frame: CGRect(x: 10, y: yPadding, width: 100, height: 30))
            lbl2.font = UIFont.systemFont(ofSize: 15)
            lbl2.text = "Search Type"
            scrollView.addSubview(lbl2)
            
            let txt2 = UITextField(frame: CGRect(x: 130, y: yPadding, width: screenSize.width - 140, height: 30))
            txt2.borderStyle = .roundedRect
            txt2.placeholder = "Type I (Incoming) or O (Outgoing)"
            txt2.tag = 1002
            txt2.delegate = self
            scrollView.addSubview(txt2)
            
            yPadding += 40
            
            let bankBtn = UIButton(type: .custom)
            bankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
            bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
            bankBtn.setTitle("Get Invoice", for: .normal)
            bankBtn.addTarget(self, action: #selector(invoiceAction(_:)), for: .touchUpInside)
            bankBtn.center.x = self.view.bounds.width / 2
            scrollView.addSubview(bankBtn)
            
            yPadding += 50
        }
        
        scrollView.contentSize = CGSize(width: screenSize.width, height: yPadding)
    }
    
    // MARK: Private methods
    fileprivate func createComponents() {
        
        var yPadding : CGFloat = 0
        let bankBtn = UIButton(type: .custom)
        bankBtn.frame = CGRect(x: 100, y: 100, width: 200, height: 38)
        bankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
        bankBtn.setTitle("Add Bank", for: .normal)
        bankBtn.addTarget(self, action: #selector(addBankAction(_:)), for: .touchUpInside)
        bankBtn.center.x = self.view.bounds.width / 2
        self.view.addSubview(bankBtn)
        
        yPadding = bankBtn.frame.origin.y + bankBtn.frame.size.height + 20
        
        let addCustomerBtn = UIButton(type: .custom)
        addCustomerBtn.frame = CGRect(x: 10, y: yPadding, width: 200, height: 38)
        addCustomerBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
        addCustomerBtn.setTitle("Add Company", for: .normal)
        addCustomerBtn.addTarget(self, action: #selector(addCompanyAction(_:)), for: .touchUpInside)
        addCustomerBtn.center.x = self.view.bounds.width / 2
        self.view.addSubview(addCustomerBtn)
        
        yPadding = addCustomerBtn.frame.origin.y + addCustomerBtn.frame.size.height + 20
        
        let addSupplierBtn = UIButton(type: .custom)
        addSupplierBtn.frame = CGRect(x: 10, y: yPadding, width: 200, height: 38)
        addSupplierBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
        addSupplierBtn.setTitle("Add Supplier", for: .normal)
        addSupplierBtn.addTarget(self, action: #selector(addSupplierAction(_:)), for: .touchUpInside)
        addSupplierBtn.center.x = self.view.bounds.width / 2
        self.view.addSubview(addSupplierBtn)
        
        yPadding = addSupplierBtn.frame.origin.y + addSupplierBtn.frame.size.height + 20
        
        let transferBtn = UIButton(type: .custom)
        transferBtn.frame = CGRect(x: 110, y: yPadding, width: 200, height: 38)
        transferBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
        transferBtn.setTitle("Transfer", for: .normal)
        transferBtn.addTarget(self, action: #selector(transferAction(_:)), for: .touchUpInside)
        transferBtn.center.x = self.view.bounds.width / 2
        self.view.addSubview(transferBtn)
        
        yPadding = transferBtn.frame.origin.y + transferBtn.frame.size.height + 20
        
        let invoiceBtn = UIButton(type: .custom)
        invoiceBtn.frame = CGRect(x: 210, y: yPadding, width: 200, height: 38)
        invoiceBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
        invoiceBtn.setTitle("Invoice", for: .normal)
        invoiceBtn.addTarget(self, action: #selector(invoiceAction(_:)), for: .touchUpInside)
        invoiceBtn.center.x = self.view.bounds.width / 2
        self.view.addSubview(invoiceBtn)
    }
    
    // MARK: Button Actions
    @objc fileprivate func addBankAction(_ sender : UIButton) {
        
        var dataStr = "{\"bankId\":\"##ID##\",\"lastUpdated\":null,\"statusCd\":2,\"statusText\":\"In Process\",\"transactionLimits\":{\"customLimits\":true,\"singleTransaction\":\"240000\",\"dailyVolume\":\"899999990\"},\"blockedCorridors\":{\"blockedCountries\":[{\"countryCode\":\"CUB\",\"isoCountryCode\":192,\"blockedDesc\":\"visaBlocked\"}]},\"bankProfile\":{\"bankName\":\"##BANKNAME##\",\"defaultCurrency\":\"USD\",\"defaultCurrencyIsoCode\":840,\"address\":{\"line1\":\"12401 Los Indios Trl\",\"unitNo\":\"120\",\"countryDisplayName\":\"USA\",\"countryIsoCode\":840},\"primaryContact\":{\"name\":\"Jim Smith\",\"jobTitle\":\"SVP\",\"email\":\"jsmith@gmail.com\",\"phone\":\"897-099-7878\"},\"secondaryContact\":{\"name\":\"Jim Smith\",\"jobTitle\":\"SVP\",\"email\":\"jsmith@gmail.com\",\"phone\":\"897-099-7878\"},\"unifiedPaymentId\":\"8891122\",\"frequencyType\":\"Every Day\",\"recipientEmail\":\"ab@gmail.com\"},\"supportedCurrencies\":[{\"currencyIsoCode\":840,\"currencyAlphaCode\":\"USD\",\"supported\":true,\"default\":true},{\"currencyIsoCode\":56,\"currencyAlphaCode\":\"BEF\",\"supported\":true,\"default\":false}]}"
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1001) as? UITextField,
            let bankId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##ID##", with: bankId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1002) as? UITextField,
            let bankName = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##BANKNAME##", with: bankName)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        let newInfo : [String : Any] = ["body" : dataStr]
        showLoading()
        
        BKSharedManager.sharedManager.addBankFor(newInfo) { [unowned self]
            (status : Bool) in
            print(status)
            
            self.hideLoading()
            DispatchQueue.main.async {
                if status {
                    let alertView = UIAlertView(title: "SUCCESS", message: "Bank Added Successfully", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
                else {
                    let alertView = UIAlertView(title: "FAILED", message: "Not able to add new bank.", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    @objc fileprivate func getBankAction(_ sender : UIButton) {
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1001) as? UITextField,
            let bankId = txt1.text {
            
            showLoading()
            BKSharedManager.sharedManager.getBankFor(bankId) { [unowned self]
                (value : [String : Any]) in
                
                self.hideLoading()
                DispatchQueue.main.async {
                    if value.count > 0 {
                        let alertView = UIAlertView(title: "SUCCESS", message: "\(value)", delegate: nil, cancelButtonTitle: "OK")
                        alertView.show()
                    }
                    else {
                        let alertView = UIAlertView(title: "FAILED", message: "Not bank found.", delegate: nil, cancelButtonTitle: "OK")
                        alertView.show()
                    }
                }
            }
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
    }
    
    @objc fileprivate func addCompanyAction(_ sender : UIButton) {
        
        var dataStr = "{\"companyBusinessId\":\"##ID##\",\"bankId\":\"##BANKID##\",\"transactionLimits\":{\"customLimits\":true,\"singleTransaction\":250000,\"dailyVolume\":99999999990},\"blockedCorridors\":{\"blockedCountries\":[{\"isoCountryCode\":4,\"blockedDesc\":\"companyBlocked\"},{\"isoCountryCode\":192,\"blockedDesc\":\"bankBlocked\"}]},\"companyProfile\":{\"defaultCurrencyIsoCode\":978,\"corporateLegalName\":\"HEB\",\"enterpriseId\":\"##ENTERID##\",\"doingBusinessAs\":\"NA\",\"industryCode\":\"22\",\"businessRegistrationNumber\":\"7889\",\"bankAccountNumber\":\"\",\"bankRoutingNumber\":\"\",\"iban\":\"\",\"clabe\":\"3670954\",\"chipsUid\":\"\",\"swiftLEI\":\"\",\"taxId\":\"7889\",\"address\":{\"line1\":\"Research Blvd\",\"unitNo\":\"214\",\"countryIsoCode\":826},\"primaryContact\":{\"name\":\"Joseph Jones\",\"jobTitle\":\"SW\",\"email\":\"joe@gmail.com\",\"phone\":\"4768\"},\"authorizedSignatory\":{\"fullName\":\"Sarah Joseph\",\"nationalityCountryCodeISO\":356,\"countryOfResidenceCodeISO\":840},\"ownershipDetails\":[{\"fullName\":\"Lacey Kate\",\"entityName\":\"\",\"address\":\"New York\",\"email\":\"lacey@gmail.com\",\"entityOwner\":\"\",\"nationalityCountryCode\":\"ALA\",\"countryOfResidence\":\"ALA\",\"nationalityCountryCodeISO\":248,\"countryOfResidenceISO\":248,\"individual\":true,\"active\":true}],\"remitReconcileProfile\":{\"remitProfile\":{\"deliveryMethod\":\"email\",\"attachmentFormat\":12,\"frequency\":\"Every day\",\"email\":\"abc@xyz.com\"},\"reconcileProfile\":{\"deliveryMethod\":\"email\",\"attachmentFormat\":12,\"frequency\":\"Every day\",\"email\":\"abc@xyz.com\"}}}}"
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1001) as? UITextField,
            let companyId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##ID##", with: companyId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1002) as? UITextField,
            let bankId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##BANKID##", with: bankId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1003) as? UITextField,
            let enterId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##ENTERID##", with: enterId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        let newInfo : [String : Any] = ["body" : dataStr]
        
        showLoading()
        BKSharedManager.sharedManager.addCompanyFor(newInfo) { [unowned self]
            (status : Bool) in
            
            self.hideLoading()
            DispatchQueue.main.async {
                if status {
                    let alertView = UIAlertView(title: "SUCCESS", message: "Company Added Successfully", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
                else {
                    let alertView = UIAlertView(title: "FAILED", message: "Not able to add new company.", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    @objc fileprivate func addSupplierAction(_ sender : UIButton) {
        
        var dataStr = "{\"bankId\":\"##BANKID##\",\"companyId\":\"##ID##\",\"supplierEnterpriseId\":\"##ENTERID##\",\"additionalSupplierInfo\":{\"customerAccountNumber\":\"89898989\",\"primaryContact\":{\"name\":\"Arpita\",\"jobTitle\":\"Xyz\",\"email\":\"abarua@gmail.com\",\"phone\":\"9898989\"}}}"
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1001) as? UITextField,
            let companyId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##BANKID##", with: companyId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1002) as? UITextField,
            let bankId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##ID##", with: bankId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1003) as? UITextField,
            let enterId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##ENTERID##", with: enterId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        let newInfo : [String : Any] = ["body" : dataStr]
        
        showLoading()
        BKSharedManager.sharedManager.addSupplierFor(newInfo) { [unowned self]
            (status : Bool) in
            
            self.hideLoading()
            DispatchQueue.main.async {
                if status {
                    let alertView = UIAlertView(title: "SUCCESS", message: "Supplier Added Successfully", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
                else {
                    let alertView = UIAlertView(title: "FAILED", message: "Not able to add new supplier.", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    @objc fileprivate func transferAction(_ sender : UIButton) {
        
        var dataStr = "{\"senderEnterpriseId\":\"##SENDERID##\",\"receiverEnterpriseId\":\"##ID##\",\"invoiceDetails\":[{\"invoiceNumber\":\"##INVOICE##\",\"poNumber\":\"125552\",\"paymentAmount\":##AMT##,\"paymentCurrencyIsoCode\":840,\"notes\":\"For Coffee\",\"partialPayment\":false}]}"
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1001) as? UITextField,
            let senderId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##SENDERID##", with: senderId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1002) as? UITextField,
            let recieveId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##ID##", with: recieveId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1003) as? UITextField,
            let invoiceId = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##INVOICE##", with: invoiceId)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1004) as? UITextField,
            let amt = txt1.text {
            dataStr = dataStr.replacingOccurrences(of: "##AMT##", with: amt)
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        let newInfo : [String : Any] = ["body" : dataStr]
        
        showLoading()
        BKSharedManager.sharedManager.makePaymentFor(newInfo) { [unowned self]
            (status : Bool) in
            
            self.hideLoading()
            DispatchQueue.main.async {
                if status {
                    let alertView = UIAlertView(title: "SUCCESS", message: "Payment Successfully", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
                else {
                    let alertView = UIAlertView(title: "FAILED", message: "Not able to make payment.", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    @objc fileprivate func invoiceAction(_ sender : UIButton) {
        
        var newInfo : [String : Any] = [:]
        if let txt1 = getViewWithTag(view: scrollView, tag: 1001) as? UITextField,
            let bankId = txt1.text {
            newInfo["bankId"] = bankId
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        if let txt1 = getViewWithTag(view: scrollView, tag: 1002) as? UITextField,
            let searchType = txt1.text {
            newInfo["searchType"] = searchType
        } else {
            print("*** NO OBJECT FOUND ***")
            return
        }
        
        showLoading()
        BKSharedManager.sharedManager.getInvoiceFor(newInfo) { [unowned self]
            (value : [String : Any]) in
            
            self.hideLoading()
            DispatchQueue.main.async {
                if value.count > 0 {
                    let alertView = UIAlertView(title: "SUCCESS", message: "\(value)", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
                else {
                    let alertView = UIAlertView(title: "FAILED", message: "No invoice found.", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    fileprivate func getViewWithTag(view : UIView, tag : Int) -> Any? {
        
        let newArray = view.subviews
        for newView in newArray {
            if (newView.tag == tag) {
                return newView
            }
        }
        return nil
    }
    
    fileprivate func createLoader() {
        
        self.loadingView = UIView(frame: UIScreen.main.bounds)
        self.loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.view.addSubview(self.loadingView)
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.center = self.loadingView.center
        self.loadingView.addSubview(indicator)
        
        self.loadingView.isHidden = true
    }
    
    fileprivate func showLoading() {
        
        DispatchQueue.main.async { [unowned self] in
            self.loadingView.isHidden = false
            self.view.endEditing(true)
        }
    }
    
    fileprivate func hideLoading() {
        
        DispatchQueue.main.async { [unowned self] in
            self.loadingView.isHidden = true
        }
    }
}

extension CreateViewController : UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

