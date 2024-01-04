//
//  TableViewController.swift
//  MapView Homework2
//
//  Created by Serper Kurmanbek on 04.01.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayOfPlaces = [
        Places(name:"Высокогорный каток - Медео",location: "Казахстан, город Алматы", descroption: "Высокогорный спортивный комплекс «Медео» («Медеу») расположен на высоте 1691 метр над уровнем моря в 15 километрах к западу от Алматы. Он был представлен общественности в 1951 году, когда здесь были проведены первые официальные соревнования. «Медеу» - самый большой в мире комплекс для занятий зимними видами спорта, здесь находится крупнейшее ледовое поле площадью 10,5 тыс. кв. м, где занимаются хоккеем, фигурным катанием, конькобежным спортом.",image: "Медео", latitude: 49.2500622, longitude: 78.8732433),
        Places(name:"Памятник группе 'Beatles'", location:"Казахстан, город Алматы", descroption: "На вершине горы, на высоте 1100 метров над уровнем моря, располагается парк Кок Тобе. Здесь же находится и телевышка – символ Алматы и одна из самых высоких телебашен в мире, её высота составляет 371 метр. Ночью телебашня подсвечивается прожекторами, так что увидеть её можно из любой точки города. Парк Кок Тобе на вершине горы - это прекрасное место для прогулок и семейного отдыха. Здесь вы найдете 30-метровое колесо обозрения, небольшой зоопарк, парк аттракционов, Аллею влюбленных, кафе и рестораны с блюдами национальной и европейской кухонь, несколько смотровых площадок, с которых открывается живописная панорама города. Обязательно посмотрите на памятник группе «Битлз»; загадайте желание, бросив монетку в фонтан «Алма», выполненный в виде яблока, которое является символом Алматы",image: "Битлз",latitude: 51.525375,longitude: 77.467076),
        Places(name:"Вознесенский Кафедральный собор", location: "Казахстан, город Алматы",descroption: "Это самый высокий православный деревянный храм, а также одно из самых высоких деревянных зданий в мире. Вместительность собора – 1800 человек. Проект 56-метрового деревянного здания, построенного в начале XX века, как поговаривают, без использования гвоздей, осуществлял инженер Андрей Зенков, поэтому храм иногда называют Кафедральным собором Зенкова. Построили собор из сруба голубой тянь-шаньской ели. Строить такое высокое здание в сейсмоопасном регионе, а Алматы – самый настоящий горный город, раскинувшийся в предгорьях Заилийского Алатау, было довольно рискованной затеей. Но Зенков справился с поставленной задачей. Да так хорошо, что здание выстояло и смогло пережить разрушительное землетрясение 1911 года, после которого практически весь Алматы лежал в руинах.", image:"Собор",latitude: 58.18266,longitude: 82.53513),
    Places(name: "Чарынский каньон",location:"Казахстан, Алматинская Область",descroption: "Чарынский каньон тянется на 154 км вдоль реки Нарын, а возраст осадочных пород, из которых сложено это чудо природы, составляет около 12 миллионов лет. Часто Чарынский каньон называют «братом» знаменитого и колоссального Гранд-Каньона в США. Это великолепной красоты захватывающее дух зрелище, кроме того, на территории Чарынского каньона расположено множество природных достопримечательностей: уникальная Ясеневая роща площадью в 5000 га из согдийских ясеней, достигающих до 10 метров в высоту (одна из двух подобных рощ во всем мире, вторая находится в Северной Америке), «Долина замков», Туранговая роща.",image: "Чарын",latitude: 43.4809389,longitude: 79.2112769)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfPlaces.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayOfPlaces[indexPath.row].name
        
        let locationLabel = cell.viewWithTag(1001) as! UILabel
        locationLabel.text = arrayOfPlaces[indexPath.row].location
                                
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: arrayOfPlaces[indexPath.row].image)
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailVc") as! ViewController
        detailVc.places = arrayOfPlaces[indexPath.row]
        navigationController?.show(detailVc, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
