import { InfoCard, PageHeader, RuleBadge } from '../components/GuideComponents';
import { ScrollGuideViewModel } from '../viewmodel/ScrollGuideViewModel';

@Component
export struct HeightAssignmentView {
  @ObjectLink viewModel: ScrollGuideViewModel;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        PageHeader({
          title: $r('app.string.height_assignment_title'),
          subtitle: $r('app.string.height_assignment_subtitle'),
          onBack: (): void => this.viewModel.goHome()
        })

        RuleBadge({
          label: $r('app.string.height_rule_scroll'),
          correct: true
        })

        RuleBadge({
          label: $r('app.string.height_rule_column'),
          correct: false
        })

        InfoCard({
          title: $r('app.string.height_card_1_title'),
          description: $r('app.string.height_card_1_description')
        })

        InfoCard({
          title: $r('app.string.height_card_2_title'),
          description: $r('app.string.height_card_2_description'),
          accent: $r('app.color.height_card_green_accent')
        })

        InfoCard({
          title: $r('app.string.height_card_3_title'),
          description: $r('app.string.height_card_3_description'),
          accent: $r('app.color.height_card_purple_accent')
        })

        Column({ space: 4 }) {
          Text($r('app.string.scrollable_distance'))
            .fontSize(10)
            .fontColor($r('app.color.text_secondary'))

          Text($r('app.string.scrollable_distance_formula'))
            .fontSize(10)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary'))
        }
        .width('100%')
        .padding(12)
        .backgroundColor($r('app.color.height_formula_background'))
        .borderRadius(14)

        Text($r('app.string.height_assignment_notice'))
          .fontSize(10)
          .fontColor($r('app.color.back_button_text'))
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding({
        left: 26,
        right: 26,
        top: 20,
        bottom: 40
      })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: false })
  }
}