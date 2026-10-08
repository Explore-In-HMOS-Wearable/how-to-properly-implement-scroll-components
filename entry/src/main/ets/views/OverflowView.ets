import { PageHeader } from '../components/GuideComponents';
import { OverflowItem } from '../model/ScrollModels';
import { ScrollGuideViewModel } from '../viewmodel/ScrollGuideViewModel';

@Component
export struct OverflowView {
  @ObjectLink viewModel: ScrollGuideViewModel;
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column({ space: 9 }) {
        PageHeader({
          title: $r('app.string.overflow_title'),
          subtitle: `${this.viewModel.overflowItems.length} items · same layout`,
          onBack: (): void => this.viewModel.goHome()
        })

        Text(this.viewModel.overflowStatus)
          .fontSize(10)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.rule_correct_text'))
          .textAlign(TextAlign.Center)
          .width('100%')

        Row({ space: 6 }) {
          Button() {
            Text($r('app.string.overflow_remove_two'))
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
          }
          .height(30)
          .layoutWeight(1)
          .enabled(!this.viewModel.isAtMinimum())
          .onClick((): void => {
            this.viewModel.removeItems();
            this.scroller.scrollEdge(Edge.Top);
          })

          Button() {
            Text($r('app.string.overflow_reset'))
              .fontSize(10)
          }
          .height(30)
          .layoutWeight(1.3)
          .onClick((): void => {
            this.viewModel.resetOverflow();
            this.scroller.scrollEdge(Edge.Top);
          })

          Button() {
            Text($r('app.string.overflow_add_two'))
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }
          .height(30)
          .layoutWeight(1)
          .enabled(!this.viewModel.isAtMaximum())
          .onClick((): void => {
            this.viewModel.addItems();
          })
        }
        .width('100%')

        ForEach(
          this.viewModel.overflowItems,
          (item: OverflowItem): void => {
            Row({ space: 10 }) {
              Text(item.id.toString())
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
                .fontColor($r('app.color.back_button_text'))
                .width(22)

              Column({ space: 2 }) {
                Text(item.title)
                  .fontSize(12)
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r('app.color.text_primary'))

                Text(item.value)
                  .fontSize(10)
                  .fontColor($r('app.color.text_secondary'))
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
            }
            .width('100%')
            .padding(11)
            .backgroundColor($r('app.color.info_card_background'))
            .borderRadius(14)
          },
          (item: OverflowItem): string => item.id.toString()
        )

        Row({ space: 6 }) {
          Button() {
            Text($r('app.string.overflow_top'))
              .fontSize(10)
          }
          .height(30)
          .layoutWeight(1)
          .onClick((): void => this.scroller.scrollEdge(Edge.Top))

          Button() {
            Text($r('app.string.overflow_bottom'))
              .fontSize(10)
          }
          .height(30)
          .layoutWeight(1)
          .onClick((): void => this.scroller.scrollEdge(Edge.Bottom))
        }
        .width('100%')

        Text($r('app.string.overflow_footer'))
          .fontSize(10)
          .fontColor($r('app.color.rule_correct_text'))
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
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: false })
  }
}