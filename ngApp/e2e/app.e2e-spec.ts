import { SimaplaPage } from './app.po';

describe('simapla App', () => {
  let page: SimaplaPage;

  beforeEach(() => {
    page = new SimaplaPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to simapla!');
  });
});
