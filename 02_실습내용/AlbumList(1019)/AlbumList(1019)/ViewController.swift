//
//  ViewController.swift
//  AlbumList(1019)
//
//  Created by Samuel K on 2017. 10. 19..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var artistLB: UILabel!
    @IBOutlet weak var genreLB: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    //앨범
    
    var albumModel:AlbumModel?
    var songList:[SongData]?
    {
        return albumModel?.songList
    }
    
    func createAlbumDataToModel(){
        self.albumModel = AlbumModel(dataDic: album)
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createAlbumDataToModel()
        
        titleLB.text = self.albumModel?.albumInfo.albumTitle
        artistLB.text = self.albumModel?.albumInfo.artist
        genreLB.text = self.albumModel?.albumInfo.genre
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.albumModel?.songList.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = songList![indexPath.row].songTitle
        
        return cell
        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

