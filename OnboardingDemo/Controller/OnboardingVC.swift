//
//  ViewController.swift
//  OnboardingDemo
//
// Created by Ahmed mazher on 2/27/21.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slides = [OnboardingSlide(title: "About shoghlana", description: "First things first, what's an animation? How is an animation created? Animation is a simulation of motion and shape", image: #imageLiteral(resourceName: "slide1")),OnboardingSlide(title: "Feature one", description: "First things first, what's an animation? How is an animation created? Animation is a simulation of motion and shape", image: #imageLiteral(resourceName: "slide2")),OnboardingSlide(title: "Feature three", description: "First things first, what's an animation? How is an animation created? Animation is a simulation of motion and shape", image: #imageLiteral(resourceName: "slide3"))]
        
        
    }

    @IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == slides.count - 1{
            print("Go to the next page")
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
