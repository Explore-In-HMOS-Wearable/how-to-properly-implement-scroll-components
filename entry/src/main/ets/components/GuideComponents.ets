@Component
export struct PageHeader {
  title: ResourceStr = '';
  subtitle: ResourceStr = '';
  onBack: () => void = (): void => {};

  build() {
    Column({ space: 4 }) {
      Button() {
        Text($r('app.string.back_button'))
          .fontSize(12)
          .fontColor($r('app.color.back_button_text'))
      }
      .height(30)
      .backgroundColor($r('app.color.transparent'))
      .onClick((): void => this.onBack())

      Text(this.title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
        .textAlign(TextAlign.Center)
        .maxLines(2)

      Text(this.subtitle)
        .fontSize(10)
        .fontColor($r('app.color.text_secondary'))
        .textAlign(TextAlign.Center)
        .maxLines(3)
    }
    .width('100%')
  }
}

@Component
export struct InfoCard {
  title: ResourceStr = '';
  description: ResourceStr = '';
  accent: ResourceColor = $r('app.color.info_card_default_accent');

  build() {
    Row({ space: 10 }) {
      Blank()
        .width(4)
        .height(42)
        .backgroundColor(this.accent)
        .borderRadius(2)

      Column({ space: 3 }) {
        Text(this.title)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .maxLines(2)

        Text(this.description)
          .fontSize(10)
          .fontColor($r('app.color.text_description'))
          .maxLines(5)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding(12)
    .backgroundColor($r('app.color.info_card_background'))
    .borderRadius(14)
  }
}

@Component
export struct RuleBadge {
  label: ResourceStr = '';
  correct: boolean = true;

  build() {
    Row({ space: 6 }) {
      Text(
        this.correct
          ? $r('app.string.rule_correct_symbol')
          : $r('app.string.rule_incorrect_symbol')
      )
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .fontColor(
          this.correct
            ? $r('app.color.rule_correct_text')
            : $r('app.color.rule_incorrect_text')
        )

      Text(this.label)
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .fontColor(
          this.correct
            ? $r('app.color.rule_correct_text')
            : $r('app.color.rule_incorrect_text')
        )
    }
    .padding({
      left: 10,
      right: 10,
      top: 7,
      bottom: 7
    })
    .backgroundColor(
      this.correct
        ? $r('app.color.rule_correct_background')
        : $r('app.color.rule_incorrect_background')
    )
    .borderRadius(12)
  }
}