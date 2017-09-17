//
//  SendMoney.swift
//  Fastcampus-0914
//
//  Created by Samuel K on 2017. 9. 14..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation



class SendMoney {
    
    func transferMoney(fromAccount: Account, toAccount: Account, ammount: Int) -> String {
        
        fromAccount.ammount -=  ammount
        toAccount.ammount += ammount
        
        return "\(fromAccount.bankName)에서 \(toAccount.bankName)으로 \(ammount)의 돈이 송금되었습니다."
    }
}
