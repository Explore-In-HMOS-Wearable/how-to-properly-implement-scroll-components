import { DemoPage } from '../model/ScrollModels';
import { ScrollGuideViewModel } from '../viewmodel/ScrollGuideViewModel';
import { HeightAssignmentView } from '../views/HeightAssignmentView';
import { HomeView } from '../views/HomeView';
import { OverflowView } from '../views/OverflowView';
import { RoundScreenView } from '../views/RoundScreenView';

@Entry
@Component
struct Index {
  @State private viewModel: ScrollGuideViewModel = new ScrollGuideViewModel();

  build() {
    Stack() {
      if (this.viewModel.currentPage === DemoPage.HOME) {
        HomeView({ viewModel: this.viewModel })
      } else if (this.viewModel.currentPage === DemoPage.HEIGHT) {
        HeightAssignmentView({ viewModel: this.viewModel })
      } else if (this.viewModel.currentPage === DemoPage.OVERFLOW) {
        OverflowView({ viewModel: this.viewModel })
      } else {
        RoundScreenView({ viewModel: this.viewModel })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}