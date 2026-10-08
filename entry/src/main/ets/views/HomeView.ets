import { DemoMenuItem } from '../model/ScrollModels';
import { ScrollGuideViewModel } from '../viewmodel/ScrollGuideViewModel';

@Component
export struct HomeView {
  @ObjectLink viewModel: ScrollGuideViewModel;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text($r('app.string.home_title'))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .margin({ top: 8 })

        Text($r('app.string.home_subtitle'))
          .fontSize(10)
          .fontColor($r('app.color.text_secondary'))
          .textAlign(TextAlign.Center)
          .margin({ bottom: 5 })

        ForEach(
          this.viewModel.menuItems,
          (item: DemoMenuItem): void => {
            Button() {
              Row({ space: 10 }) {
                Text(item.number)
                  .fontSize(10)
                  .fontWeight(FontWeight.Bold)
                  .fontColor($r('app.color.back_button_text'))
                  .width(24)

                Column({ space: 2 }) {
                  Text(item.title)
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .fontColor($r('app.color.text_primary'))
                    .maxLines(1)

                  Text(item.description)
                    .fontSize(10)
                    .fontColor($r('app.color.text_secondary'))
                    .maxLines(2)
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
              }
            }
            .width('100%')
            .height(78)
            .padding({
              left: 12,
              right: 12
            })
            .backgroundColor($r('app.color.info_card_background'))
            .borderRadius(16)
            .onClick((): void => {
              this.viewModel.openPage(item.page);
            })
          },
          (item: DemoMenuItem): string => item.number
        )

        Text($r('app.string.home_rule'))
          .fontSize(10)
          .fontColor($r('app.color.rule_correct_text'))
          .textAlign(TextAlign.Center)
          .margin({ top: 4 })
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