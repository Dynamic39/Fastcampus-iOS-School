//
//  SettingsViewController.swift
//  (1022)SettingsTable
//
//  Created by Samuel K on 2017. 10. 22..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit


//매뉴 타입 지정
enum MenuType
{
    case InfoMenu
    case ChangePW
    case Logout
    case Non
}

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    //각 구분별, 섹션 리스트를 별도 정리
    //섹션별 리스트 구성(텍스트 레이블, 이미지)
    var settingsImage = [["info", "pw", "logout", "delacc"],["ver"], ["autoLogin"]]
    //하기에 새로운 파일 생성
    
    var settingInfo:SettingManager?
    
    //정보에 대한 세부 리스트 정리
    //자동 로그인, 해당셀은 버튼이 포함되어야 함.

    override func viewDidLoad() {
        super.viewDidLoad()

        //2차 정리
        settingInfo = SettingManager()
        tableView.reloadData()

    }
    
    
    func settingMenuType(section:Int, row:Int) -> MenuType {
        if section == 0 {
            if row == 0
            {return MenuType.InfoMenu}
            if row == 1
            {return MenuType.ChangePW}
            if row == 2
            {return MenuType.Logout}
        }
        return MenuType.Non
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //전체 세팅할 row의 갯수를 정한다
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //전체 row의 갯수이므로, 섹션별로 구분후, 카운트 하여, 값을 리턴하여 준다.
        return (settingInfo?.setInfor[section].specificOptions.count)!
    }
    
    //섹션의 개수를 구별하여 주는 메서드를 호출한다(아직 안배운것)
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return (settingInfo?.setInfor.count)!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell
        let sectionData = settingInfo?.setInfor[indexPath.section]
        let rowData = sectionData?.specificOptions[indexPath.row]
        
        //이미지, 레이블 세팅
        cell?.tableImage.image = UIImage(named: "\(settingsImage[indexPath.section][indexPath.row])")
        cell?.cellInformaiton = rowData
        if indexPath.section == 1 && indexPath.row == 0 {
            cell?.showVersion()
        }
        return cell!
    }
    
    //row의 높이를 조절하는 메서드를 호출한다.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
        
    }
    
    //각 섹션의 타이틀을 설정한다 반환값은 스트링이다.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return settingInfo?.setInfor[section].dividedSection
        
    }
    
    
    // 셀이 선택되었을때 이동하는 메서드를 구현함.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //매뉴 타입을 불러오는 인스턴스를 생성한다.
        
        let menuType = settingMenuType(section: indexPath.section, row: indexPath.row)
        
        // 스위치 케이스를 사용하여, 각각의 열거형에서 행해지는 행위들을 결정함
        
        switch menuType {
            
        // 프로필 파일로 돌아가는 코드 구현
        case .InfoMenu:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "ProfileInfo")
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        case .ChangePW:
            print("비밀번호를 변경할 에정입니다.")
        case .Logout:
            let aletVC = UIAlertController(title: "Logout", message: "로그아웃이 되면 서비스를 이용하실 수 없습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            aletVC.addAction(okAction)
            aletVC.addAction(CancelAction)
            
            self.present(aletVC, animated: true, completion: nil)
            
        default:
            print("아무것도 없어요!")
        }
        
    }
    
}
