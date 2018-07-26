//
//  ViewController.swift
//  BlockTest
//
//  Created by Ananya on 9/3/18.
//  Copyright © 2018 Ananya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red: 63/255, green: 81/255, blue: 181/255, alpha: 1.0)
        createComponents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let gbankBtn = UIButton(type: .custom)
        gbankBtn.frame = CGRect(x: 100, y: yPadding, width: 200, height: 38)
        gbankBtn.backgroundColor = UIColor(red: 1.0, green: 51/255, blue: 51/255, alpha: 1.0)
        gbankBtn.setTitle("Get Bank", for: .normal)
        gbankBtn.addTarget(self, action: #selector(getBankAction(_:)), for: .touchUpInside)
        gbankBtn.center.x = self.view.bounds.width / 2
        self.view.addSubview(gbankBtn)
        
        yPadding = gbankBtn.frame.origin.y + gbankBtn.frame.size.height + 20
        
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
    
        let createView = CreateViewController()
        createView.initViewFor(1)
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    @objc fileprivate func getBankAction(_ sender : UIButton) {
        
        let createView = CreateViewController()
        createView.initViewFor(2)
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    @objc fileprivate func addCompanyAction(_ sender : UIButton) {

        let createView = CreateViewController()
        createView.initViewFor(3)
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    @objc fileprivate func addSupplierAction(_ sender : UIButton) {
        
        let createView = CreateViewController()
        createView.initViewFor(4)
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    @objc fileprivate func transferAction(_ sender : UIButton) {
        
        let createView = CreateViewController()
        createView.initViewFor(5)
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    @objc fileprivate func invoiceAction(_ sender : UIButton) {
        
        let createView = CreateViewController()
        createView.initViewFor(6)
        self.navigationController?.pushViewController(createView, animated: true)
    }
}

