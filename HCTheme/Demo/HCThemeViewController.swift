/*******************************************************************************
 # File        : HCThemeViewController.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit


class HCThemeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        _configUI()
    }
}

// MARK: - 初始化UI
extension HCThemeViewController {
    private func _configUI() {
        _configNavigationBar()
    }

    private func _configNavigationBar() {
        self.tableView.hc_BackgroundColor = HCTheme.Color.moduleBg
        self.navigationController?.navigationBar.hc_BarTintColor = HCTheme.Color.moduleBg
        self.title = "Theme"
        let rightView = UIView()
        let changeBtn = UIButton()
        changeBtn.setTitle("change", for: .normal)
        changeBtn.hc_setTitleColorPicker(HCTheme.Color.keyWord, forState: .normal)
        changeBtn.contentHorizontalAlignment = .right
        changeBtn.addTarget(self, action: #selector(changeBtnClick), for: .touchUpInside)
        rightView.addSubview(changeBtn)

        rightView.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        changeBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightView)
    }
    
    @objc func changeBtnClick() {
        
        let theme = HCThemeManager.share.current == HCTheme.night ? HCTheme.normal : HCTheme.night
        HCThemeManager.share.configThemeType(theme)
    }
    
}

extension HCThemeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HCThemeCell.cellWithTableView(tableView: tableView)
        cell.titleImage.hc_Image = HCTheme.Image.App_Store
        cell.titleLab.hc_TextColor = HCTheme.Color.keyWord
        cell.contentView.hc_BackgroundColor = HCTheme.Color.pageBg

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
