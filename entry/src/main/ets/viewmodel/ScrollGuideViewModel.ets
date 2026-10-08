import {
  DEFAULT_OVERFLOW_ITEMS,
  DemoMenuItem,
  DemoPage,
  MAX_OVERFLOW_ITEMS,
  MIN_OVERFLOW_ITEMS,
  OverflowItem
} from '../model/ScrollModels';

@Observed
export class ScrollGuideViewModel {
  currentPage: DemoPage = DemoPage.HOME;
  overflowItems: OverflowItem[] = [];
  overflowStatus: string = '';
  showSafeArea: boolean = true;
  finalActionCompleted: boolean = false;
  finalActionMessage: string = 'Tap the button to test the final action.';
  readonly menuItems: DemoMenuItem[] = [
    new DemoMenuItem(DemoPage.HEIGHT, '01', 'Height assignment', 'Constrain Scroll, not its Column'),
    new DemoMenuItem(DemoPage.OVERFLOW, '02', 'Content overflow', 'Short and long content with one layout'),
    new DemoMenuItem(DemoPage.ROUND_SCREEN, '03', 'Round display', 'Safe padding and reachable last content')
  ];

  constructor() {
    this.overflowItems = this.createOverflowItems(DEFAULT_OVERFLOW_ITEMS);
    this.overflowStatus = `${DEFAULT_OVERFLOW_ITEMS} items are visible.`;
  }

  openPage(page: DemoPage): void {
    this.currentPage = page;
  }

  goHome(): void {
    this.currentPage = DemoPage.HOME;
  }

  addItems(): void {
    const nextCount: number = Math.min(MAX_OVERFLOW_ITEMS, this.overflowItems.length + 2);
    this.overflowItems = this.createOverflowItems(nextCount);
    this.overflowStatus = nextCount >= MAX_OVERFLOW_ITEMS ?
      `Maximum reached: ${nextCount} items.` : `Added items: ${nextCount} total.`;
  }

  removeItems(): void {
    const nextCount: number = Math.max(MIN_OVERFLOW_ITEMS, this.overflowItems.length - 2);
    this.overflowItems = this.createOverflowItems(nextCount);
    this.overflowStatus = nextCount <= MIN_OVERFLOW_ITEMS ?
      `Minimum reached: ${nextCount} items.` : `Removed items: ${nextCount} total.`;
  }

  resetOverflow(): void {
    this.overflowItems = this.createOverflowItems(DEFAULT_OVERFLOW_ITEMS);
    this.overflowStatus = `Reset complete: ${DEFAULT_OVERFLOW_ITEMS} items.`;
  }

  toggleSafeArea(): void {
    this.showSafeArea = !this.showSafeArea;
  }

  runFinalAction(): void {
    this.finalActionCompleted = true;
    this.finalActionMessage = 'Final action completed successfully.';
  }

  resetFinalAction(): void {
    this.finalActionCompleted = false;
    this.finalActionMessage = 'Tap the button to test the final action.';
  }

  private createOverflowItems(count: number): OverflowItem[] {
    const items: OverflowItem[] = [];
    for (let index: number = 0; index < count; index++) {
      const number: number = index + 1;
      items.push(
        new OverflowItem(number, `Content item ${number}`, number % 2 === 0 ? 'Dynamic detail' : 'Natural height'));
    }
    return items;
  }

  isAtMaximum(): boolean {
    return this.overflowItems.length >= MAX_OVERFLOW_ITEMS;
  }

  isAtMinimum(): boolean {
    return this.overflowItems.length <= MIN_OVERFLOW_ITEMS;
  }
}