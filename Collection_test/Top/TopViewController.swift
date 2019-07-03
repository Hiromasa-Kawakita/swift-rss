//
//  TopViewController.swift
//  Collection_test
//
//  Created by 川北 紘正 on 2019/06/10.
//  Copyright © 2019 川北 紘正. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TopViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //let models = Model.createModels()
    var stations: [Station] = [Station]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "記事一覧"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getArticles()
        
        //Xib
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    func getArticles() { Alamofire.request("https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Flifehacking.jp%2Ffeed%2Fatom%2F", method: .get)
        .responseJSON { response in
            //                print(response.result.value)
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            var stationInfo: [Station] = []
            json["items"].forEach { (_, json) in
                
                let station: Station = Station.init(title: json["title"].string, description: json["pubDate"].string, image: json["thumbnail"].string, link: json["link"].string)
                stationInfo.append(station)
            }
            self.stations = stationInfo
            self.collectionView.reloadData()
        }
    }
}

extension TopViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "WebView", bundle: nil).instantiateInitialViewController()! as! WebViewController
        vc.station = stations[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell

        
        cell.image.image = UIImage(named: "defaultImage")
        
        
        
        let station1 = stations[indexPath.row]
        let image: UIImage?
        
//        if let imageUrl = station1.image
        
            
//            { image = UIImage(url: imageUrl) }
//        else { image = UIImage(named: "defaultImage") }
        
//        station1.image
        
        
        
//        let image: UIImage = UIImage(url: station1.image!)
        cell.label.text = station1.title!
        cell.descriptionLabel.text = station1.description!

        
        DispatchQueue.global().async {
            let image = UIImage(url: station1.image!)
            
            DispatchQueue.main.async {
                cell.image.image = image
            }
            
        }
        
        
//        getImage( url: station1.image!, comletion: { image in
//
//             //UIImage(url: station1.image ?? "" )
//        })
//
        
    
       //: ?? UIImage(named: "defaultImage")
        return cell
    }
    

    
}

extension TopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize: CGSize
        let widthSize = UIScreen.main.bounds.width
//        let heightSize = UIScreen.main.bounds.height * 0.3571

        switch indexPath.row {
        case 2, 3, 6, 7:
            cellSize = CGSize(width: widthSize * 0.4830, height: 320)
            break
        default:
            cellSize = CGSize(width: widthSize, height: 320)
        }

        return cellSize
    }
}
