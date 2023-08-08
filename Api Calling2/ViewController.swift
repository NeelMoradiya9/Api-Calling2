//
//  ViewController.swift
//  Api Calling2
//
//  Created by Neel  on 04/08/23.
//

import UIKit
import Alamofire

class Data1 : Codable {
    var status : String
    var totalResults : Int
    var articles : [Articles]
    
}

class Articles : Codable{
    var source : Source
    var author : String?
    var title : String?
    var description : String
    var url : String
    var urlToImage : String
    var publishedAt : String
    var content : String
}

class Source : Codable{
    var id : String
    var name : String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview1: UITableView!
    
    var obj : Data1?
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    
    //    func getdata(){
    //        print("Start")
    //        let link =  URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d362e37d62fb4d69b4e85609a1e7c145")
    //        var ur = URLRequest(url: link!)
    //        ur.httpMethod = "GET"
    //
    //        URLSession.shared.dataTask(with: ur) { [self] data , response , error in
    //            do{
    //                if error == nil{
    //                    self.obj = try JSONDecoder().decode(Data1.self, from: data!)
    //                    dump(obj)
    //                    DispatchQueue.main.async { [self] in
    //                        tableview.reloadData()
    //                    }
    //                }
    //
    //            }catch(let err){
    //                print(err.localizedDescription)
    //            }
    //        }.resume()
    //
    //    }
    
    
    
    func getdata() {
        AF.request("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d362e37d62fb4d69b4e85609a1e7c145",method: .get).responseData { [self] respo in
            switch respo.result {
            case.success(let data):
                do{
                    obj = try JSONDecoder().decode(Data1.self, from: data)
                    dump(obj)
                    DispatchQueue.main.async { [self] in
                        tableview1.reloadData()
                    }
                }
                catch(let err){
                    print(err.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obj?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview1.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell1
        cell.label1.text = obj!.articles[indexPath.row].title
        cell.label2.text = obj!.articles[indexPath.row].description
        cell.label3.text = obj!.articles[indexPath.row].publishedAt
        cell.img.image = urlToImg(url: (obj?.articles[indexPath.row].urlToImage)!)
        return cell
    }
    func urlToImg(url:String)->UIImage?{
        let data = try? Data(contentsOf: URL(string: url) as! URL)
        return UIImage(data: data!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigation(link: obj?.articles[indexPath.row].url ?? "")
        
    }
    
    
    func navigation(link : String)
    {
        let a  = storyboard?.instantiateViewController(identifier: "ViewController1")as!
        ViewController1
        a.webv = link
        navigationController?.pushViewController(a, animated: true)
    }
    
    
    
    
}

