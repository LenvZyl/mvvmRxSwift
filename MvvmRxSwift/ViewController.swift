import UIKit
import Foundation
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel!
    
    static func initStoryBoard(viewModel: RestaurantListViewModel) -> ViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.tableFooterView = UIView()
        viewModel.fetchRestaurantViewModel().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
    }


}

