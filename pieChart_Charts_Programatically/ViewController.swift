//
//  ViewController.swift
//  pieChart_Charts_Programatically
//
//  Created by masato on 5/11/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    var chartView: PieChartView!
    var pieChartDataSet: ChartDataSet!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // PieChartData instance
        var pieChartData = PieChartData()
//
//        // グラフの中央にテキストを表示
//        chartView.centerText? = "2018/11/05"

//        // PieChartを真ん中まで塗りつぶす。Defaultではtrue
//        chartView.drawHoleEnabled = false

        // call setGraph() func in order to set Data
        pieChartData = setGraph()

        // set CGRect constraints to chart
        chartView = PieChartView(frame: CGRect(x: 0, y: view.safeAreaInsets.bottom, width: view.frame.width, height: view.frame.height / 2))

        chartView.data = pieChartData

        // PieChart
        chartView.centerText = "Balances"

        self.view.addSubview(chartView)
    }


     func setGraph() -> PieChartData
     {
        // Prepare Data Array
        var entries: [PieChartDataEntry] = Array()


        // Input Data Set

        entries.append(PieChartDataEntry(value: 20.0, label: "BTC", icon: #imageLiteral(resourceName: "💲BTC")))
        entries.append(PieChartDataEntry(value: 4.0, label: "ETC", icon: #imageLiteral(resourceName: "💲ETH")))
        entries.append(PieChartDataEntry(value: 6.0, label: "AUGUR", icon: #imageLiteral(resourceName: "💲AUGUR")))
        entries.append(PieChartDataEntry(value: 3.0, label: "Golem", icon: #imageLiteral(resourceName: "💲Golem")))
        entries.append(PieChartDataEntry(value: 12.0, label: "Litecoin", icon: #imageLiteral(resourceName: "💲LingtCoin")))
        entries.append(PieChartDataEntry(value: 18, label: "DASH"))

        let dataSet = PieChartDataSet(values: entries, label: "Crypto Currencies")


        // PieChartColor
        var colors: [UIColor] = []

        for _ in 0..<entries.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))

            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }

        dataSet.colors = colors

        return PieChartData(dataSet: dataSet)

}

}
