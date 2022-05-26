//
//  ViewController.swift
//  random
//
//  Created by Max Dovhopolyi on 5÷21÷22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorkins: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var Num1:Float = 0.00
    var Num2:Float = 0.00
    var Workings:String = ""
    var Result:String = ""
    var Operation:Bool = false;
    var NewAction:Bool = false;
    var LastChar:String = ""
    var SpecialSymbol:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ClearAll()
            
    }
    
    
    func ClearAll(){
        Num1 = 0
        Num2 = 0
        Workings = "0"
        Result = "0"
        NewAction = false
        Operation = false
        calculatorWorkins.text = "0"
        calculatorResults.text = "0"
        LastChar = ""
    }

    @IBAction func allClearTap(_ sender: Any) {
        ClearAll()
    }
    
    // Logic of backtap
    @IBAction func backTap(_ sender: Any) {
      
        
    
        Result.removeLast()
          
        if (Result.last == "." || Result.last == "-"){
            Result.removeLast()
        }
        if(Result.count <= 0){
            Result = "0"
        }
        calculatorResults.text = Result
      
    }
    
    // Changing symbol in workings
    func ChangingSymbol(value: String, symbol: String) -> Bool{
        if (LastChar == "+" || LastChar == "-" || LastChar == "×" || LastChar == "÷"){
            Workings.removeLast()
            Workings += symbol
            return true
            
        }
        return false
    }
    
    
    func SavingValues(){
        Num2 = (Result as NSString).floatValue
        Result = didMath(val1: Num1, val2: Num2, action: String(Workings.suffix(1)))
        Num1 = (Result as NSString).floatValue
    }
    // Math Logic
    func MathLogic(value: String){
        // If there is a previous operation than complete it
        if(Workings != "0" && SpecialSymbol != "="){
            SavingValues()
        }
        // If there were no previous actions - save recently typed number
        else if (NewAction == false){
                Num1 = (Result as NSString).floatValue
            NewAction = true
            
        }
        else if (Workings.suffix(1) == "%"){
            Result = didMath(val1: Num1, val2: Num2, action: String(Workings.suffix(1)))
            Num1 = (Result as NSString).floatValue
        }
        else{
            SavingValues()
            
        }
        
        Workings = String(Result) + " " + value
        Operation = true
    }
    
    
    
    func DidTap(value: String){
        
        switch value{
            
        case "+", "-", "×", "÷", "%":

            if (ChangingSymbol(value: LastChar, symbol: value)){
                break
            }
            
            MathLogic(value: value)
            
        case "=":
            if (LastChar == "="){
                break
            }
            if (Workings.suffix(1) != "+" && Workings.suffix(1) != "-" && Workings.suffix(1) != "×" && Workings.suffix(1) != "÷" && Workings.suffix(1) != "%"){
                break
            }
            
            SavingValues()
            Workings = Result
            Operation = true
            NewAction = false
            

            
        case ".": // Handling restrictions of a dot
            if(Result == "0" || Result == "" || Operation == true){
                Result = "0."
                Operation = false
            }
            else if (!Result.contains(".")){
                Result += value
            }
            
        default:
            if(Result == "0" || Operation == true){
                
                if(value != "0"){
                    Result = value
                    Operation = false
                    
                }
                
            }
            
               
            else{
                Result += value

            }
        
        }
        calculatorWorkins.text = Workings
        calculatorResults.text = Result
        LastChar = value
        if(value == "+" || value == "-" || value == "×" || value == "÷" || value == "="){
            SpecialSymbol = value
        }
        
    
    }
    // Formatting value (15.00 -> 15, 15.25252525 -> 15.25)
    func format(value: Float) -> String {
            var formattedValue = String(format: "%.4f", value)

            while formattedValue.last == "0" {
                formattedValue.removeLast()
            }

            if formattedValue.last == "." {
                formattedValue.removeLast()
            }

            return formattedValue
        }
    
    func didMath(val1: Float, val2: Float, action: String) -> String {
        switch action{
        case "+":
            return format(value: val1 + val2)
            
        case "-":
            return format(value: val1 - val2)
       
        case "×":
            return format(value: val1 * val2)
        
        case "÷":
            return format(value: val1 / val2)
        case "%":
            return format(value: val1 / 100)
        default:
            return "0"
        }
            
    }
    
    
    @IBAction func percentTap(_ sender: Any) {
        DidTap(value: "%")
    }
    @IBAction func divideTap(_ sender: Any) {
        DidTap(value: "÷")
    }
    @IBAction func multiplyTap(_ sender: Any) {
        DidTap(value: "×")
    }
    @IBAction func substituteTap(_ sender: Any) {
        DidTap(value: "-")
    }
    @IBAction func addTap(_ sender: Any) {
        DidTap(value: "+")
    }
    @IBAction func equalTap(_ sender: Any) {
        DidTap(value: "=")
    }
    @IBAction func dotTap(_ sender: Any) {
        DidTap(value: ".")
    }
    @IBAction func zeroTap(_ sender: Any) {
        DidTap(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        DidTap(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        DidTap(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) {
        DidTap(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        DidTap(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        DidTap(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        DidTap(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        DidTap(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        DidTap(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        DidTap(value: "9")
    }
    
}
    
    
    
    


