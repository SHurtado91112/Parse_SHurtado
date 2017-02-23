//
//  Util.swift
//  Parse_SHurtado
//
//  Created by Steven Hurtado on 2/22/17.
//  Copyright © 2017 Steven Hurtado. All rights reserved.
//

import Foundation
import UIKit

class Util: NSObject
{
    class func invokeAlertMethod(_ strTitle: NSString, strBody: NSString, delegate: AnyObject?)
    {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        
        let alert = UIAlertController(title: strTitle as String, message: strBody as String, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            rootVC?.dismiss(animated: true, completion: nil)
            })
        
        alert.addAction(action1)
        
        rootVC?.present(alert, animated: true, completion: nil)
    }
}
