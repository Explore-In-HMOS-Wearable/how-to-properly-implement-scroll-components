import { InfoCard, PageHeader } from '../components/GuideComponents';
import {
  LONG_PAGE_BOTTOM_PADDING,
  ROUND_HORIZONTAL_PADDING,
  ROUND_TOP_PADDING
} from '../model/ScrollModels';
import { ScrollGuideViewModel } from '../viewmodel/ScrollGuideViewModel';

@Component
export struct RoundScreenView {
  @ObjectLink viewModel: ScrollGuideViewModel;
  private scroller: Scroller = new Scroller();

  build() {
    Stack() {
      Scroll(this.scroller) {
        Column({ space: 10 }) {
          PageHeader({
            title: $r('app.string.round_title'),
            subtitle: $r('app.string.round_subtitle'),
            onBack: (): void => this.viewModel.goHome()
          })

          Button() {
            Text(
              this.viewModel.showSafeArea
                ? $r('app.string.round_hide_safe_area')
                : $r('app.string.round_show_safe_area')
            )
              .fontSize(10)
          }
          .height(30)
          .width('80%')
          .onClick((): void => this.viewModel.toggleSafeArea())

          Button() {
            Text($r('app.string.round_jump_final_action'))
              .fontSize(10)
          }
          .height(30)
          .width('80%')
          .backgroundColor($r('app.color.secondary_button_background'))
          .onClick((): void => this.scroller.scrollEdge(Edge.Bottom))

          InfoCard({
            title: $r('app.string.round_horizontal_inset_title'),
            description: $r('app.string.round_horizontal_inset_description')
          })

          InfoCard({
            title: $r('app.string.round_natural_card_title'),
            description: $r('app.string.round_natural_card_description'),
            accent: $r('app.color.rule_correct_text')
          })

          InfoCard({
            title: $r('app.string.round_bottom_room_title'),
            description: $r('app.string.round_bottom_room_description'),
            accent: $r('app.color.height_card_purple_accent')
          })

          Button() {
            Text(
              this.viewModel.finalActionCompleted
                ? $r('app.string.round_completed')
                : $r('app.string.round_final_action')
            )
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
          }
          .height(30)
          .width('80%')
          .backgroundColor(
            this.viewModel.finalActionCompleted
              ? $r('app.color.final_action_completed_background')
              : $r('app.color.info_card_default_accent')
          )
          .onClick((): void => this.viewModel.runFinalAction())

          Text(this.viewModel.finalActionMessage)
            .fontSize(10)
            .fontWeight(FontWeight.Medium)
            .fontColor(
              this.viewModel.finalActionCompleted
                ? $r('app.color.rule_correct_text')
                : $r('app.color.final_action_message')
            )
            .textAlign(TextAlign.Center)
            .width('100%')

          Button() {
            Text($r('app.string.round_reset_action'))
              .fontSize(10)
          }
          .height(30)
          .width('80%')
          .enabled(this.viewModel.finalActionCompleted)
          .onClick((): void => this.viewModel.resetFinalAction())

          Text($r('app.string.round_end_content'))
            .fontSize(10)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.back_button_text'))
            .textAlign(TextAlign.Center)
            .width('100%')
        }
        .width('100%')
        .padding({
          left: ROUND_HORIZONTAL_PADDING,
          right: ROUND_HORIZONTAL_PADDING,
          top: ROUND_TOP_PADDING,
          bottom: LONG_PAGE_BOTTOM_PADDING
        })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: false })

      if (this.viewModel.showSafeArea) {
        Circle()
          .width('86%')
          .height('86%')
          .fill($r('app.color.transparent'))
          .stroke($r('app.color.safe_area_stroke'))
          .strokeWidth(1)
          .hitTestBehavior(HitTestMode.None)
      }
    }
    .width('100%')
    .height('100%')
  }
}