import UIKit

class AddCarVC2: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate{
    
    
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    
    //Automobiles
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var bikeImage: UIImageView!
    @IBOutlet weak var truckImage: UIImageView!
    
    //Colors
    
    @IBOutlet weak var blueImage: UIImageView!
    @IBOutlet weak var greenImage: UIImageView!
    @IBOutlet weak var redImage: UIImageView!
    @IBOutlet weak var whiteImage: UIImageView!
    @IBOutlet weak var blackImage: UIImageView!
    @IBOutlet weak var purpleImage: UIImageView!
    
    //car choiches
    let brandListCar = ["BMW", "Mercedess","Opel","Volkswagens"]
    let bmwListCar = ["Seria 5", "Seria 4", "Seria 3" , "Seria 1"]
    let opelListCar = ["Astra" , "Insgnia" , "Vectra" , "Corsa"]
    let mercedessListCar = ["A-Class" , "C-Class" , "E-Class" , "S-Class"]
    let volkswagensListCar = ["Golf" , "Passat" , "Jetta" , "Bora"]
    
    //moto choiches
    let brandListMoto = ["Honda" , "Kawasaki" ,"Suzuki" ,"BMW"]
    let hondaListMoto = ["CB125F", "CBR650", "GL1800", "CRF1000"]
    let kawasakiListMoto = ["NINJA 400" , "AN650","W800","Z1000 SX"]
    let suzukiListMoto = ["GSX-R1000","DL250 V-Storm","GSXS-125 AL-8"," AN400 K-8 Burgman"]
    let bmwListMoto = ["K1300 R","R1200 LE","K1200 GT","K1200 LT"]
    
    //truck choiches
    let brandListTruck = ["Honda" , "23232" ,"Suz2324uki" ,"BM11W"]
    let hondaListTruck = ["CB125F", "CBR650", "GL1800", "CRF1000"]
    let kawasakiListTruck = ["NINJA 400" , "AN650","W800","Z1000 SX"]
    let suzukiListTruck = ["GSX-R1000","DL250 V-Storm","GSXS-125 AL-8"," AN400 K-8 Burgman"]
    let bmwListTruck = ["K1300 R","R1200 LE","K1200 GT","K1200 LT"]
    
    
    
    var selectedItemsArray:[String] = []
    var selectedBrand:[String] = []
    var tapGesture = UITapGestureRecognizer()
    
    private let brandPickerView = UIPickerView()
    private let modelPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandPickerView.delegate = self
        modelPickerView.delegate = self
        brandTextField.inputView = brandPickerView
        modelTextField.inputView = modelPickerView
        
        dismissPickerView()
        
        
        //enable tap on automobile
        carImage.isUserInteractionEnabled = true
        bikeImage.isUserInteractionEnabled = true
        truckImage.isUserInteractionEnabled = true
        
        let tapOnCar = UITapGestureRecognizer(target: self, action: #selector(self.handleTapCar(_:)))
        carImage.addGestureRecognizer(tapOnCar)
               
        let tapOnBike = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBike(_:)))
        bikeImage.addGestureRecognizer(tapOnBike)
               
        let tapOnTruck = UITapGestureRecognizer(target: self, action: #selector(self.handleTapTruck(_:)))
        truckImage.addGestureRecognizer(tapOnTruck)
        
        
        //enable tap on colors
        
        blueImage.isUserInteractionEnabled = true
        greenImage.isUserInteractionEnabled = true
        redImage.isUserInteractionEnabled = true
        whiteImage.isUserInteractionEnabled = true
        blackImage.isUserInteractionEnabled = true
        purpleImage.isUserInteractionEnabled = true
        
        let tapOnBlue = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBlue(_:)))
        blueImage.addGestureRecognizer(tapOnBlue)
        
        let tapOnGreen = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGreen(_:)))
        greenImage.addGestureRecognizer(tapOnGreen)
        
        let tapOnRed = UITapGestureRecognizer(target: self, action: #selector(self.handleTapRed(_:)))
        redImage.addGestureRecognizer(tapOnRed)
        
        let tapOnWhite = UITapGestureRecognizer(target: self, action: #selector(self.handleTapWhite(_:)))
        whiteImage.addGestureRecognizer(tapOnWhite)
        
        let tapOnBlack = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBlack(_:)))
        blackImage.addGestureRecognizer(tapOnBlack)
        
        let tapOnPurple = UITapGestureRecognizer(target: self, action: #selector(self.handleTapPurple(_:)))
        purpleImage.addGestureRecognizer(tapOnPurple)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == brandPickerView {
            return selectedBrand.count
        }
        return  selectedItemsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == brandPickerView {
            return selectedBrand[row]
        }
        return selectedItemsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == brandPickerView {
            
            switch row {
            case 0:
                selectedItemsArray = bmwListCar
            case 1:
                selectedItemsArray = mercedessListCar
            case 2:
                selectedItemsArray = opelListCar
            case 3:
                selectedItemsArray = volkswagensListCar
            default:
                selectedItemsArray = []
            }
            
            modelTextField.text = ""
            brandTextField.text = brandListCar[row]
            modelPickerView.reloadAllComponents()
            
        } else if pickerView == modelPickerView {
            // Get the current item
            let item = selectedItemsArray[row]
            // Assign value to a label based on which array we are using
            modelTextField.text = item
        }
    }
    
    
    func dismissPickerView() {
        let toolBar = UIToolbar ()
        toolBar.sizeToFit()
        let button = UIBarButtonItem (title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        brandTextField.inputAccessoryView = toolBar
        modelTextField.inputAccessoryView = toolBar
    }
    
    @objc func action () {
        view.endEditing(true)
    }
    
    @objc func handleTapCar(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        
        carImage.isHighlighted.toggle()
        if carImage.isHighlighted{
            selectedBrand = brandListCar
        }
        bikeImage.isHighlighted = false
        truckImage.isHighlighted = false
        
        
    }
    @objc func handleTapBike (_ sender:UITapGestureRecognizer) {
        self.view.endEditing(true)
        
        bikeImage.isHighlighted.toggle()
        if bikeImage.isHighlighted{
            selectedBrand = brandListMoto
        }
        truckImage.isHighlighted = false
        carImage.isHighlighted = false
        
    }
    
    @objc func handleTapTruck(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        truckImage.isHighlighted.toggle()
        if truckImage.isHighlighted {
            selectedBrand = brandListTruck
            
        }
        bikeImage.isHighlighted = false
        carImage.isHighlighted = false
        
        
        }
    @objc func handleTapBlue(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        blueImage.isHighlighted.toggle()
        greenImage.isHighlighted = false
        redImage.isHighlighted = false
        whiteImage.isHighlighted = false
        blackImage.isHighlighted = false
        purpleImage.isHighlighted = false
        }
    
    @objc func handleTapGreen(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        greenImage.isHighlighted.toggle()
        redImage.isHighlighted = false
        whiteImage.isHighlighted = false
        blackImage.isHighlighted = false
        purpleImage.isHighlighted = false
        blueImage.isHighlighted = false
        
        }
    
    @objc func handleTapRed(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        redImage.isHighlighted.toggle()
        greenImage.isHighlighted = false
        whiteImage.isHighlighted = false
        blackImage.isHighlighted = false
        purpleImage.isHighlighted = false
        blueImage.isHighlighted = false
        }
    
    @objc func handleTapWhite(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        whiteImage.isHighlighted.toggle()
        greenImage.isHighlighted = false
        redImage.isHighlighted = false
        blackImage.isHighlighted = false
        purpleImage.isHighlighted = false
        blueImage.isHighlighted = false
        
        }
    
    @objc func handleTapBlack(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        blackImage.isHighlighted.toggle()
        greenImage.isHighlighted = false
        redImage.isHighlighted = false
        whiteImage.isHighlighted = false
        purpleImage.isHighlighted = false
        blueImage.isHighlighted = false
        }
    
    @objc func handleTapPurple(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
        purpleImage.isHighlighted.toggle()
        greenImage.isHighlighted = false
        redImage.isHighlighted = false
        whiteImage.isHighlighted = false
        blackImage.isHighlighted = false
        blueImage.isHighlighted = false
        }
    
    
    }
        
        
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        

