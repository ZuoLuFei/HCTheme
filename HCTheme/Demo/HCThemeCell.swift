/*******************************************************************************
 # File        : HCThemeCell.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/11/7
 # Corporation : ####
 # Description : <#Description Logs#>
 ******************************************************************************/

import UIKit

class HCThemeCell: UITableViewCell {
    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    static func cellWithTableView(tableView: UITableView) -> HCThemeCell {
        let ID = "HCThemeCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ID) as? HCThemeCell else {
            
            return Bundle.main.loadNibNamed("HCThemeCell", owner: self, options: nil)?.last as? HCThemeCell ?? HCThemeCell()
        }
        
        return cell
    }
    
}
