//
//  ViewController.swift
//  ColorPicker
//
//  Created by Tarun Jain on 28/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var pickedColor = UIColor.systemTeal
    private var colorPicker = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        setupBarButton()
        view.backgroundColor = pickedColor
    }
    
    @IBAction func didTapColorPicker(_ sender: Any) {
        selectColor()
    }
    
    private func selectColor() {
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = pickedColor
        self.present(colorPicker, animated: true)
    }
    
    private func setupBarButton() {
        let pickColorAction = UIAction(title: "Pick Color") { _ in
            self.selectColor()
        }
        let pickColorBarButton = UIBarButtonItem(image: UIImage(systemName: "eyedropper"), primaryAction: pickColorAction)
        navigationItem.rightBarButtonItem = pickColorBarButton
    }
}


extension ViewController : UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        pickedColor = viewController.selectedColor
        view.backgroundColor = pickedColor
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("Color Picker Controller Did Finish")
    }
}
