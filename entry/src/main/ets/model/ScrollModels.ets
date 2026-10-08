export enum DemoPage {
  HOME = 0,
  HEIGHT = 1,
  OVERFLOW = 2,
  ROUND_SCREEN = 3
}

export class DemoMenuItem {
  readonly page: DemoPage;
  readonly number: string;
  readonly title: string;
  readonly description: string;

  constructor(page: DemoPage, number: string, title: string, description: string) {
    this.page = page;
    this.number = number;
    this.title = title;
    this.description = description;
  }
}

export class OverflowItem {
  readonly id: number;
  readonly title: string;
  readonly value: string;

  constructor(id: number, title: string, value: string) {
    this.id = id;
    this.title = title;
    this.value = value;
  }
}

export const ROUND_HORIZONTAL_PADDING: number = 26;
export const ROUND_TOP_PADDING: number = 20;
export const LONG_PAGE_BOTTOM_PADDING: number = 40;
export const MIN_OVERFLOW_ITEMS: number = 2;
export const DEFAULT_OVERFLOW_ITEMS: number = 7;
export const MAX_OVERFLOW_ITEMS: number = 12;