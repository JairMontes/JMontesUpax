import UIKit

class graficosController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
        var questions: [Data] = []
        var slides: [Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
                
                getInfo()

                view.bringSubviewToFront(pageControl)
    }

        func getInfo(){
                DataViewModel.Get { responseSource, resultSource, errorSource in
                    if let response = responseSource {
                        if 200...299 ~= response.statusCode {
                            print(resultSource!.data.first!.pregunta)
                            self.questions = resultSource!.data
                            DispatchQueue.main.async {
                                self.createSlides()
                                self.setupSlideScrollView()
                                
                            }
                        }
                    }
                    
                    if let error = errorSource {
                        print("Ocurrio un error \(error.localizedDescription)")
                    }
                    
                }
            }
    
    func createSlides()  {
            self.slides.removeAll()
            for pregunta in questions {
                let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide.lblPregunta.text = pregunta.pregunta
                slide.setCollectionView(respuestas: pregunta.values)
                slide.SetPieChart()

                self.slides.append(slide)
            }

            pageControl.currentPage = 0
            pageControl.numberOfPages = slides.count



        }
    
    
    func setupSlideScrollView () {
              scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
              scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(self.slides.count), height: view.frame.height)
              scrollView.isPagingEnabled = true
              
              for i in 0 ..< self.slides.count {
                  self.slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                  scrollView.addSubview(self.slides[i])
              }
          }
       }
    
extension graficosController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)

    }
}
