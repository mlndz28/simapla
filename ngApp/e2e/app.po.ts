import { browser, by, element } from 'protractor';

export class SimaplaPage {
  navigateTo() {
    return browser.get('/');
  }

  getParagraphText() {
    return element(by.css('simapla-root h1')).getText();
  }
}
