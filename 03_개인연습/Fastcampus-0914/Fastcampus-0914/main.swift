//
//  main.swift
//  Fastcampus-0914
//
//  Created by Samuel K on 2017. 9. 14..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

print("Hello, World!")

let account1: Account = Account(bankName: "우리은행", ammount: 3000)

let accoutn2: Account = Account(bankName: "카카오뱅크", ammount: 5000)

let account3: Account = Account(bankName: "국민은행", ammount: 6000)

let customer1: Customer = Customer(name: "라이언", address: "강남")
let customer2: Customer = Customer(name: "어피치", address: "대전")


customer1.accouts = [account1, accoutn2]
customer2.accouts = [account3]

let banker: SendMoney = SendMoney()

print(banker.transferMoney(fromAccount: customer1.accouts[0], toAccount: customer2.accouts[0], ammount: 1000))

print(customer1.totalAmmount())



