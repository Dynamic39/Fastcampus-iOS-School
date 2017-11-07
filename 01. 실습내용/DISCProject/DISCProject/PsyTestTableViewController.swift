//
//  PsyTestTableViewController.swift
//  DISCProject
//
//  Created by Samuel K on 2017. 11. 2..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class PsyTestTableViewController: UITableViewController {
    
    var exampleData:Datamodel?
    var resultModel:ResultDataModels?
    var resultType:String?
    var resultTextField:String?
    var count:Int = 0
    
        var d:Int = 0
        var i:Int = 0
        var s:Int = 0
        var c:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleData = Datamodel()
        resultModel = ResultDataModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //숫자는 확인하여 다른 값으로 변경하여 줄것
        
        guard let returnCounter:Int = exampleData?.exampleList.count else {return 0}
        
        return returnCounter
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as? QCell
        
        
        switch indexPath.row {
        case 0:
         cell?.testText.text = exampleData?.exampleList[count]["d"]
        case 1:
            cell?.testText.text = exampleData?.exampleList[count]["i"]
        case 2:
            cell?.testText.text = exampleData?.exampleList[count]["s"]
        case 3:
            cell?.testText.text = exampleData?.exampleList[count]["c"]
        default:
            print("에러처리")
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       let size = tableView.frame.size.height / 4 * 0.8
        return size
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if count < 23 {
            count += 1
            print(count)
            tableView.reloadData()
            print("인덱스", indexPath.row)
            switch indexPath.row {
            case 0:
                d += 1
            case 1:
                i += 1
            case 2:
                s += 1
            case 3:
                c += 1
            default:
                print("에러 처리!")
            }
            
            print("d", d)
            print("i", i)
            print("s", s)
            print("c", c)
            
        } else {
            
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nexvVC = segue.destination as? ResultViewController
        
        checkResult()
        
        nexvVC?.test = self.resultType!
        //nexvVC?.resultText.text = self.resultType
        print(resultType)
        nexvVC?.test2 = self.resultTextField!
        print(resultTextField)
    }
    
    
    var compareStr = ""
    var compareInt = 0
    
    func checkResult()
    {
        if compareInt < self.d {
            compareStr = "d"
            compareInt = self.d
            resultType = resultModel?.resutModels?.d?.title!
            resultTextField = resultModel?.resutModels?.d?.msg!
            
        }else if compareInt < self.i {
            compareStr = "i"
            compareInt = self.i
            resultType = resultModel?.resutModels?.i?.title!
            resultTextField = resultModel?.resutModels?.i?.msg!
            
            
        }else if compareInt < self.s {
            compareStr = "s"
            compareInt = self.s
            resultType = resultModel?.resutModels?.s?.title!
            resultTextField = resultModel?.resutModels?.s?.msg!
            
            
        }else if compareInt < self.c {
            compareStr = "c"
            compareInt = self.c
            resultType = resultModel?.resutModels?.c?.title!
            resultTextField = resultModel?.resutModels?.c?.msg!
        }
        print("String", compareStr)
        print("Int", compareInt)
    }
}
